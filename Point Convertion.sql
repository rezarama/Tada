SELECT
      "MerchantId"            AS "MerchantId",
      "CardProgramId"         AS "CardProgramId",
      "type"                  AS "type",
      "walletName"            AS "walletName",
      DATE("createdAt")       AS "date",
      COUNT("TransactionId")  AS "transactionCount",
      SUM("amount")           AS "total",
      SUM("convertedAmount")  AS "totalConverted"
    FROM (
      SELECT
      "Transactions"."id"            AS "TransactionId",
      "CardPrograms"."id"            AS "CardProgramId",
      "Transactions"."MerchantId"    AS "MerchantId",
      "Transactions"."type"          AS "type",
      "Transactions"."createdAt",
      CASE
        WHEN "Transactions"."type" IN ('walletTopup', 'walletRedemption') THEN "PaymentDetails"."rewardType"
        WHEN "Transactions"."type" IN ('topup', 'redemption', 'activation') THEN "CardPrograms"."balanceName"
        WHEN "Transactions"."type" = 'expired' THEN COALESCE("PaymentDetails"."rewardType", "CardPrograms"."balanceName")
        ELSE ''
      END AS "walletName",
      CASE
        WHEN "Transactions"."type" = 'expired' AND
             "PaymentDetails"."rewardType" IS NOT NULL AND
             "PaymentDetails"."unitType" = 'point' THEN
          NULL
        ELSE
          COALESCE ("PaymentDetails"."amount", "Transactions"."amount")
      END AS "amount",
      CASE
        WHEN "PaymentDetails"."conversionRate" > 0 THEN
          CASE
            WHEN "Transactions"."type" IN ('walletTopup') THEN
              FLOOR(COALESCE ("PaymentDetails"."amount", "Transactions"."amount")::DOUBLE PRECISION / "PaymentDetails"."conversionRate"::DOUBLE PRECISION)
            WHEN "Transactions"."type" IN ('walletRedemption') THEN
              CEIL(COALESCE ("PaymentDetails"."amount", "Transactions"."amount")::DOUBLE PRECISION / "PaymentDetails"."conversionRate"::DOUBLE PRECISION)
            WHEN "Transactions"."type" IN ('topup', 'activation') AND "CardPrograms"."isPointProgram" THEN
              FLOOR(COALESCE ("PaymentDetails"."amount", "Transactions"."amount")::DOUBLE PRECISION / "PaymentDetails"."conversionRate"::DOUBLE PRECISION)
            WHEN "Transactions"."type" IN ('redemption', 'expired') AND "CardPrograms"."isPointProgram" THEN
              CEIL(COALESCE ("PaymentDetails"."amount", "Transactions"."amount")::DOUBLE PRECISION / "PaymentDetails"."conversionRate"::DOUBLE PRECISION)
            ELSE NULL
          END
        WHEN "Transactions"."type" = 'expired' AND
             "PaymentDetails"."rewardType" IS NOT NULL AND
             "PaymentDetails"."unitType" = 'point' THEN
          "Transactions"."amount"
        WHEN "Transactions"."type" = 'activation' AND
             "CardPrograms"."isPointProgram" AND
             "CardPrograms"."pointProgramRate" > 0 THEN
          FLOOR("Transactions"."amount"::DOUBLE PRECISION / "CardPrograms"."pointProgramRate"::DOUBLE PRECISION)
        WHEN "Transactions"."type" IN ('walletTopup', 'walletRedemption') AND
             "PaymentDetails"."unitType" = 'point' THEN
          "PaymentDetails"."amount"
        ELSE NULL
      END AS "convertedAmount"
      FROM "Transactions"
        JOIN "Stores" ON "Stores"."id" = "Transactions"."StoreId"
        JOIN "CardInventories" ON "CardInventories"."no" = "Transactions"."cardNo"
        JOIN "CardPrograms" ON "CardPrograms"."programId" = "Transactions"."programId"
        LEFT JOIN "PaymentDetails" ON "PaymentDetails"."TransactionId" = "Transactions"."id"
      WHERE
        "Transactions"."type" IN ('activation', 'expired', 'redemption', 'walletRedemption', 'topup', 'walletTopup') AND
        "Transactions"."status" = 'accepted' AND
        (
          "PaymentDetails"."type" IN ('Balance', 'Wallet') OR
          "Transactions"."type" IN ('activation', 'topup', 'walletTopup') OR
          "PaymentDetails"."id" IS NULL
        ) AND
        "CardInventories"."status" IS NOT NULL AND
        "Stores"."location" NOT ILIKE '%DUMMY%' AND
        "Stores"."location" NOT ILIKE '%TEST%'
      GROUP BY 1, 2, "PaymentDetails"."id"
    ) AS "transactions"
    WHERE
      ("amount" IS NOT NULL OR "convertedAmount" IS NOT NULL) AND
      "walletName" IS NOT NULL
    GROUP BY 1, 2, 3, 4, 5
    ORDER BY 5;