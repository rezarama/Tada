SELECT 
  "GCIUsers"."phone" AS "phone",
  "CardInventories"."no" AS "no",
  MIN("CardInventories"."activatedAt") AS "activatedAt",
  MIN("Transactions"."createdAt") AS "createdAt (Transactions)"
FROM "public"."CardInventories" "CardInventories"
  INNER JOIN "public"."Transactions" "Transactions" ON ("CardInventories"."no" = "Transactions"."cardNo")
  INNER JOIN "public"."GCIUserGiftcards" "GCIUserGiftcards" ON ("CardInventories"."id" = "GCIUserGiftcards"."relationId")
  INNER JOIN "public"."GCIUsers" "GCIUsers" ON ("GCIUserGiftcards"."GCIUserId" = "GCIUsers"."id")
WHERE "Transactions"."type"='redemption'
AND "Transactions"."status"='accepted'
AND "Transactions"."MerchantId"=37
AND "GCIUsers"."phone" in()