select o.created_at as "Time" , o."transaction_id" as "Order Reference", c.name as "Channel", it.name as "Item Name", i.quantity "Item Qty" , i.subtotal as "Subtotal"
, s.price as "Shipping Fee" , o.total+s.price as "Total", op.card_no as "Card Number"
  from orders as o

  inner join order_items as i
    on i.order_id = o.id
  inner join items as it
    on it.id = i.item_id
  inner join shipping_fees as s
    on s.id = o.delivery_city
  inner join clients as c
    on c.id = o.client_id
  left join order_payments as op
    on op.order_id = o.id

where --o.created_at >= '2017-07-31 19:00'
  o.deleted_at is null
  and o.status not in ('5')
  and i.status not in ('6')
  and o.transaction_id in
  ('GCIYW7NX3IKMUVQ',
'GCIZ6QKB743CEIN',
'GCI67HF21VCQ3IO',
'GCITEXK8VSWP5UI',
'GCI8W4KE7VOGY3S',
'GCIYC3FAIWO4D8T',
'GCIQ1PNHTJM7XA8',
'GCI24Q8WHMBI7GN',
'GCIP46BOTYNKWJR',
'GCIPFDZAI90WEHN',
'GCIPFDZAI90WEHN',
'GCI7YXT45PS92DL',
'GCI8FJ4A5NQL2ED',
'GCIM1RHQWNA7EP0',
'GCIUZQ7XERM5JNT',
'GCIUZQ7XERM5JNT',
'GCI9ZC8TAFJMRSU',
'GCI9ZC8TAFJMRSU',
'GCIEW0MZS5893U2',
'GCI7ZF6HDV0PMCR',
'GCI6ZC2QBUO5V4J',
'GCIBNMOV6TUPSQX',
'GCIDFSAW85CY24J',
'GCIAJRW3IKTB26N',
'GCIJKSE8PWQDVNM',
'GCIRJBWOHLZDNA3',
'GCICZV2FLPNSBE4',
'GCI6F0BKTSU1GXQ',
'GCI6F0BKTSU1GXQ',
'GCI2YOBC65EFXHA',
'GCIXWZULR728JOE',
'GCI4QWAFZME0T68',
'GCI6H0NPT1SCAE3',
'GCIG0FHRP6C2XTY',
'GCIGPM6SCWN35A0',
'GCIHPTGAUX9NLO0',
'GCIBVUGY481A02J',
'GCIL689IUFCZSB5',
'GCI52QBKPVI6EGW',
'GCI52QBKPVI6EGW',
'GCIBG98KJP23H7W',
'GCIEQP2OGMXAB1T',
'GCIEQP2OGMXAB1T',
'GCIEQP2OGMXAB1T',
'GCIBHIESG8FUTMO',
'GCIY9GU5QFSDLM1',
'GCIY9GU5QFSDLM1',
'GCIWOFV360MCPSX',
'GCIPQ12OF4LTB5V',
'GCIZ25J7NLTW0KO',
'GCIC7QEZ4K3JSR0',
'GCI0LNVWP5YE82D',
'GCI0GQ4AZLY5MXB',
'GCI5PM4BA3WGI6T',
'GCIDXHY7OT0BE1K',
'GCIC4XQGJTR9KSL',
'GCIC4XQGJTR9KSL',
'GCITC63B7NPEKJW',
'GCIML9DFJBZPHYK',
'GCII6B9FQDWJY4K',
'GCII6B9FQDWJY4K',
'GCIFYBGJI9081R4',
'GCIFYBGJI9081R4',
'GCIN5Q8KBP13U4Y',
'GCIIQHRUD6GBAM7',
'GCIVQIXJGPYE8Z9',
'GCIVQIXJGPYE8Z9',
'GCIVNP01FD584EW',
'GCI2WYGB5OM9TSQ',
'GCIOU0L7CW3KRPV',
'GCIPVXKJHWRU3EZ',
'GCIKBUFOXZIJ0TP',
'GCI7RE9820HK6F4',
'GCIWI8SNFV3YRM4',
'GCIWI8SNFV3YRM4',
'GCIY2BLPM0QVOUI',
'GCIY2BLPM0QVOUI',
'GCIWXJ85PUTD1LC',
'GCIDNHKQO3GUIT2',
'GCIIZ0EH6OLW7BG',
'GCIX6QP24ZCOAYV',
'GCIX6QP24ZCOAYV',
'GCIX6QP24ZCOAYV',
'GCIO9LGNWIF476B',
'GCIO9LGNWIF476B',
'GCIJD9YC4B0IE1F',
'GCIBHQ2ELKPZWFN',
'GCIFN5X0B26S4J9',
'GCIFN5X0B26S4J9',
'GCISAZ58DW7THMN',
'GCI6VNQCIJU1OTP',
'GCI58HCVOJPMX27',
'GCIQ21PTE340V8C',
'GCIRU3I0HMV1COW',
'GCIOADNLG3YFCWV',
'GCIOADNLG3YFCWV',
'GCIRLDCNY7MIGX4',
'GCIMVL4103FJ29A',
'GCIHAF7KWBXDR8E',
'GCIRJHTZDL92BI3',
'GCIMP39AHBQLS8O',
'GCIAOCYV2Z14JIL',
'GCIWNGA4RVH1FJB',
'GCIZIAQO4U7WDXN',
'GCI5OIVSGD2Y90F',
'GCING3M12TCYSWL',
'GCIDS1WZM9KHAU2',
'GCIDS1WZM9KHAU2',
'GCIXEBA1D6N5WUY',
'GCIS3K0H7NVOCMT',
'GCI1DLEQCURJVIP',
'GCIMOFWL4SIT60J',
'GCIYAH2KPIZWQM3',
'GCIOE123BS0YQX6',
'GCIUM0JYAQR56HP',
'GCIIP0XD73RQHEM',
'GCIC25VASW9PMHF',
'GCIC25VASW9PMHF',
'GCIFNRXC1Q9MZWP',
'GCI764QWBNJE30C',
'GCI5F3J68VKTNLS',
'GCI57LW68C139IV',
'GCIBP69SJ3U1IF2',
'GCIR9BWC714XTMJ',
'GCILOV7K5M2CT9H',
'GCINI197ULY8ZBG',
'GCIRD28ZS4WMF3N',
'GCICZ6T5O3PMRID',
'GCIPB7XIN8UC0A5',
'GCIHW2DY9VEP7FC',
'GCIRPNMQZ8G7BSY',
'GCIDZOIKG95JAXH',
'GCILX4SPGTOAK2D',
'GCIPZYTBAVLD3H1',
'GCIYCURMEKWS4OD',
'GCILQ2OGNZI0TB6',
'GCICURQVZ432BA5',
'GCIF7C6QZ3SUO01',
'GCIMPSHT2ACKJNR',
'GCICOSKU74T0VZ6',
'GCI5MZFNAT6VCWH',
'GCI5MZFNAT6VCWH',
'GCI5MZFNAT6VCWH',
'GCIO5FQBNAU049Y',
'GCIO5FQBNAU049Y',
'GCIV14YEO9L8F0H',
'GCIMIA3WNS5ZR82',
'GCIB3TS67WENKJQ',
'GCI9BYFM6E0XS1T',
'GCIRYQC12B9LA0S',
'GCIR9BX1KLVZ2NQ',
'GCIHYBOZF1UW2LK',
'GCIIPMZK8DS6Y4E',
'GCI24XBSMTZILN5',
'GCIJVLBK3Q1M4WF',
'GCIJVLBK3Q1M4WF',
'GCI92OVLQHPNS87',
'GCI67RQJ9O3M5TI',
'GCIS1LTMI0H95BJ',
'GCI192XUCGQOJTY',
'GCIY29KMJWUNIZ6',
'GCI9IFNGPO3JXRV',
'GCI1DIEZJKBWG0V',
'GCI7R61OCHTZA5G',
'GCI69KG3I7VFDJ2',
'GCIE6GS5CYXMJU7',
'GCIH3AV7OXPSKCD',
'GCIRJE9BPMQWXD2',
'GCIRJE9BPMQWXD2',
'GCI3SPU7W2LYEMN',
'GCIJTXWP9YM1CG6',
'GCIJTXWP9YM1CG6',
'GCI2K0ZFB15NQVX',
'GCI2K0ZFB15NQVX',
'GCIJS5A6M3I4ELF',
'GCINAZIHF23OV1Y',
'GCIZBJ9N4WK8HX6',
'GCIT3M9LQFZ0HUA',
'GCITJD4A2LNCFQX',
'GCI7IZ1CJ98OHUK',
'GCIHB2LP8NCWZSK',
'GCISOXJ3VTYD8N1',
'GCIJLHYFQEKTI0N',
'GCIJLY8RFPUE0Q6',
'GCIJLY8RFPUE0Q6',
'GCIQKXJLOB17830',
'GCIDVHGA7IWNZ69',
'GCIDVHGA7IWNZ69',
'GCIT7QG58CNH03L',
'GCIT7QG58CNH03L',
'GCIT7QG58CNH03L',
'GCIT7QG58CNH03L',
'GCIT7QG58CNH03L',
'GCIT7QG58CNH03L',
'GCIVLOGCJ0HUIQ2',
'GCIVLOGCJ0HUIQ2',
'GCIVLOGCJ0HUIQ2',
'GCI5WUCJ7LVTPQA',
'GCI5WUCJ7LVTPQA',
'GCI5WUCJ7LVTPQA',
'GCI5WUCJ7LVTPQA',
'GCI5WUCJ7LVTPQA',
'GCI5WUCJ7LVTPQA',
'GCI3SPNTIO9MQ0J',
'GCIV43T2WHX89RC',
'GCIV43T2WHX89RC',
'GCIFVMCO071SQWG',
'GCI1DABCJLNYJRJ',
'GCI1SW44JY82LFC',
'GCI2Q18PBVYAJYQ',
'GCI4TJ3EPR9THNV',
'GCI5HEJ9BND3VPA',
'GCI7WMDDZICNLB6',
'GCIBGLFW6F9DGW4',
'GCIHYX9O8UU1ZF7',
'GCII7U5CPW7VW9E',
'GCIIQGJN028EW9Z',
'GCIK3RVKYN1HMWW',
'GCIOW36YYRXD3W9',
'GCIOXKVHV539JJT',
'GCIQ7KMHKLZCM3B',
'GCIRBYIQICWJVLB',
'GCISVFIPE7IHAFT',
'GCIXWGLDUBA6K21',
'GCIYDUM0YV1DVBX',
'GCIZ6Q3TRND1ED9',
'GCIJVOL3ICEZGU5',
'GCIJVOL3ICEZGU5',
'GCIJVOL3ICEZGU5',
'GCI08DKRF590PNG',
'GCI0BET3FDVRE4S',
'GCI0D0UC3UA3LL8',
'GCI0J9XRQTSV0JD',
'GCI0PD6FJJ7Z7DF',
'GCI0S8GMYM93X18',
'GCI0SO1VPO2CVSP',
'GCI16BJR1MCP4N4',
'GCI1G45MXW61EMT',
'GCI1GNLNVW5QBPZ',
'GCI1P7ROCH25STC',
'GCI1QFR3ZQVDG8R',
'GCI1QYEZGMWEOSI',
'GCI1S9P9N6RA2NR',
'GCI1WL1H0QS671P',
'GCI2QB2ZH4MZZDY',
'GCI2U2DA13NWJ97',
'GCI36FM7YTPCMO1',
'GCI3CWEALMLCZT2',
'GCI3E6Y8ESXS1LS',
'GCI3E9NVLK0C9SX',
'GCI3PKS92ZP7LGX',
'GCI3YZIPNP1TUB4',
'GCI469100YR25QS',
'GCI48MXI69EV1AD',
'GCI48V10BSN816H',
'GCI4MEOXVVH5YND',
'GCI4QBHWDN09M53',
'GCI4TOMEX5ACWC0',
'GCI4YNV93MGNH3C',
'GCI52RJJL4DQIH0',
'GCI57LOFDIRTRG5',
'GCI59CYT5Z36CLE',
'GCI59D3C9207AUJ',
'GCI5EO6QLRSV43C',
'GCI5LZG0B2HOWPZ',
'GCI66188MW2VDDE',
'GCI6EAIPDTW6E9O',
'GCI6HL5IHEVZ8OW',
'GCI6WVY4IGUF6NI',
'GCI71YUFIRZ2E2K',
'GCI7G7IIFXC0HXR',
'GCI7NW5W1SO33QB',
'GCI7OPM3URY9PTC',
'GCI7UMYA8XLTMYV',
'GCI80TEXO8SXDSP',
'GCI817EOAKYPY8H',
'GCI88PPMUFS0RBI',
'GCI8DYTWFTQRVRI',
'GCI8SB09U8NEIBV',
'GCI8VKWQGL3AHC6',
'GCI8Y4BK9KDFEE1',
'GCI934PFYJ6228E',
'GCI96NJ3UA3PSIX',
'GCI9ANLB964CTEX',
'GCI9M0UL4K134KT',
'GCI9MT052LRR1LH',
'GCI9N2FBSHYLPPX',
'GCI9NT1XGYRTFRH',
'GCI9UKA6OZLVV2N',
'GCIA1IJH8TMTUBH',
'GCIA20SK7DAN4WA',
'GCIA31LKSJZ9S9Y',
'GCIA5SUXXTWOCUZ',
'GCIAB91N2MYYNZ8',
'GCIAIFXBKNG63FJ',
'GCIAK88H3O6545E',
'GCIATB81M57Q9DD',
'GCIATNS7PAQOUWG',
'GCIB554P0HMWCTJ',
'GCIBGS5T56OQLYV',
'GCIBH5GH1Z6O71Z',
'GCIBN2UPKWLB6Q3',
'GCIBP35S8H638K6',
'GCIBPLCCOWXUG38',
'GCIBR4BZ052VHV8',
'GCIBSE7SKICJJR1',
'GCIBU0KZIBME1GG',
'GCIBX9GCFZ6JAPZ',
'GCIBZAG9I787CM6',
'GCICU6PQU8WO34E',
'GCICXHO5N27X3HA',
'GCIDGJ6VV75Y7KZ',
'GCIDI1URE7HTFIA',
'GCIDYWJJPVJNLDB',
'GCIE7U6TEA3LWDP',
'GCIEE3Q4V1ST4P5',
'GCIEFPZ8K01KN90',
'GCIEK3XH98GRQLF',
'GCIEQC0O6E83TNJ',
'GCIERCUXU30TCM8',
'GCIFE3HTO8JQL0G',
'GCIFEX7I3I1K50Z',
'GCIFJO7389PT8OK',
'GCIFN278PFNQHP9',
'GCIFSUA9HDH8H4T',
'GCIFTKQK9EJMRH6',
'GCIG1EA78KT0E6S',
'GCIG1FC3WKXR1BD',
'GCIG29XCWVC0KPW',
'GCIG6NCP3B93DPO',
'GCIG8WNHK6TQ634',
'GCIGACN0R5YKB6B',
'GCIGBQ3VCZH88Y0',
'GCIGHV07TMI39O3',
'GCIGI7W3MZYEG66',
'GCIGK6EBS54ELRQ',
'GCIGS2PY37JFI1W',
'GCIGUSEEQHOQTH0',
'GCIH18P2DE97197',
'GCIH1I05RUTLYU2',
'GCIH6CU8KXAWXIP',
'GCIHI68JAKH9PWD',
'GCII04MKSGW80W3',
'GCIICVUZTJSKZX6',
'GCIIDXVM7JKC0GP',
'GCIIEL1FLWYUN2P',
'GCIIIZIAOMX8TVZ',
'GCIIYSQNS6KWP3T',
'GCIJ0IF4FS7WUXN',
'GCIJDSSV1X2HYHV',
'GCIJET2IIJAYEGE',
'GCIJEW3LO07L6VO',
'GCIJHRZL9J3CYHN',
'GCIJKL1UDBM9UIW',
'GCIJLOPS6UA3VBW',
'GCIJPHJGV4OGMLH',
'GCIJPUPO2IK3ZY1',
'GCIJQYSUQUZFCBZ',
'GCIJRULAYC71PU0',
'GCIJW80FDWA5P3Z',
'GCIK3ZK2VI85BKZ',
'GCIK9RT8GBCYJJ1',
'GCIKBV58UI9HZ03',
'GCIKD5WV6JFK8FS',
'GCIKNE8NT1QMIZ2',
'GCIKOOJ6PGNKCXI',
'GCIKQZIGM26K7KN',
'GCIKTCULJMRL2AD',
'GCIL0VI5MR0K2XZ',
'GCIL4T2N0IC5FM5',
'GCILB6LZTB7KA32',
'GCILE5SF78P8LZV',
'GCILILG2FEMYVYM',
'GCILK3U4ERTZQJU',
'GCILKGKKGADIO6C',
'GCILO6JCXSNCHBN',
'GCILP8BK7AN63JN',
'GCILR0XLVX9ZYYT',
'GCILRMX6V95LG08',
'GCILWFOPQDP65PC',
'GCILYR1T4XXJKYH',
'GCIM5PA3B5QK1SP',
'GCIMAS78VNQQ5RL',
'GCIMC16P3EKQKR7',
'GCIMGX7O3X1SCS2',
'GCIMPO53FI4ZH99',
'GCIMT5ZFGEVESFO',
'GCIMZK8ADRYX22H',
'GCIN2IMVZURBS3C',
'GCIN3VREGMM4Z8V',
'GCIN6X2YWR0GEWN',
'GCIN7TYR79QZUZ1',
'GCINBDASRFQAWHP',
'GCING0P0QTRY3K8',
'GCINGGGXK442O6G',
'GCINH72JH9D4UK8',
'GCINK5MP19UHYMR',
'GCINK7KI9EPFP6S',
'GCINP791UJ4JXW1',
'GCINPKWW6KZ5CJ1',
'GCINS87CZLTPZJK',
'GCINUHNFXW8J2UT',
'GCIOEVCUY1NBWK3',
'GCIOJNJT8FVLH11',
'GCIOLBMC9DWNRGS',
'GCIOMU83WLQNSHQ',
'GCIOOFLQTYFEIV1',
'GCIOU74GGSEZBCY',
'GCIOV3I6M655PME',
'GCIP6ZF632Z727S',
'GCIPC6OOQ21KNCW',
'GCIPEWE1NRBDY6D',
'GCIPNU9KWEQX5PV',
'GCIPNYL9AWB25LG',
'GCIPY4319LMPLGU',
'GCIPYQM9AYF8I6S',
'GCIQ2ME59ROLI8Z',
'GCIQ47RE5OBLL8F',
'GCIQ6LVU2ZXBKB0',
'GCIQ731SQIVE88L',
'GCIQ80V5IKEJBBT',
'GCIQCZC1CG7UEUE',
'GCIQH7LP7MOVXPU',
'GCIQIBI6J7I36XF',
'GCIQJ130RI9TVRS',
'GCIQP99NB454T3J',
'GCIQUSVQNMXC76Z',
'GCIQVM0EZZN9LVJ',
'GCIR8BHZF14Z6WL',
'GCIRAZV2RV4M1DZ',
'GCIS0RQGNHIP9UL',
'GCIS1MUX1H4LKBP',
'GCIS2R8V6FL25I4',
'GCIS9YMOXQNH7GG',
'GCISB7HRQAXGTKK',
'GCISN5TT486AFS0',
'GCISNUBNLU47AXX',
'GCITQXPAFIL9VVY',
'GCITVKHTVG7NL1J',
'GCITYEKEU5XZNLP',
'GCIU1XPG9GXNYG4',
'GCIU3ELUMRUPIUA',
'GCIU4EXQU1RYX3I',
'GCIU5SD7WHMYDTX',
'GCIUJFEWE3XU6QY',
'GCIUQ8I0IPBN308',
'GCIV0YR3XUASXRD',
'GCIV50Q12T81D10',
'GCIV5RGQCEDG9Z9',
'GCIVC2YC19OG9AN',
'GCIVERWW8XWMRBU',
'GCIVF1MQXV62A2T',
'GCIVT6ZJ2KZMIZQ',
'GCIW0BKXUAX3P09',
'GCIWF8N60WPRG6E',
'GCIWNH6IIAT8VM6',
'GCIWOMPJ6V5DSNN',
'GCIWQOL3NUWML8K',
'GCIWUAPRAZLHP8H',
'GCIXC55EPETY2BU',
'GCIXF3WB19MURE4',
'GCIXSU9H571K3LZ',
'GCIXXJM6WE0W9Z9',
'GCIY2TL1PLSNKQ1',
'GCIY3WE4I393MV7',
'GCIYEAXC3O5CP9V',
'GCIYGEGKHZX8UVT',
'GCIYHHYAZBTT97Z',
'GCIYLYBG40W3R2L',
'GCIYVYQK5DP1QCO',
'GCIYW2NFU590IMP',
'GCIZ1N82OK195KV',
'GCIZ5IHF0B3TIQK',
'GCIZ6ZGDOAYBBZL',
'GCIZ7G643UANU7M',
'GCIZFKHPIAR7YOC',
'GCIZNJF2PYC6WQG',
'GCIZOVVTYKA80IS',
'GCIZV44CFUL296C',
'GCIZZT9UBVBHQ12',
'GCI3IDOUL6JZVTE',
'GCISCVFTNGHJRDZ',
'GCIPOIEQ51SHRDC',
'GCIL5RJ2PQTFD9W',
'GCIR89DXOYZCK51',
'GCICNZP6SYF31U9',
'GCI89JECF1P6LIQ',
'GCI36JZG5DAS9FH',
'GCI36JZG5DAS9FH',
'GCIWNECMSXIQGPA',
'GCI3WDIGYZN5R2Q',
'GCI0LOJ9QPSX2NK',
'GCIXR20FK8OUPSI',
'GCIDBZWR2K5E0GC',
'GCI5HUINXFCLWRD',
'GCIM89Y03UKO1PT',
'GCIM89Y03UKO1PT',
'GCIM89Y03UKO1PT',
'GCIM89Y03UKO1PT',
'GCIRDJKUHEONVB9',
'GCIRDJKUHEONVB9',
'GCIDI2ZE8BPKYOV',
'GCILEO35FY2UGAJ',
'GCIHYNFR1LIC8DA',
'GCIHYNFR1LIC8DA',
'GCIAM07BRWDC8TG',
'GCIC59OJBFGV41S',
'GCIC59OJBFGV41S',
'GCI6Y75A4JL0GPI',
'GCIRLUIHG7CKXBJ',
'GCIS8LVFMBOU0IG',
'GCI3LMPVKOS217N',
'GCI0JG4XOER1AQM',
'GCIL697AWRJ3MCT',
'GCI2BJKQDZLXIM9',
'GCI18T5LPMFS4C2',
'GCI407G6RTVJX5Q',
'GCIFT6Y28V74Q5X',
'GCIFT6Y28V74Q5X',
'GCIRPA19O8ZISQF',
'GCIKZOBLW39U8R1',
'GCIH1AONGKX7QZM',
'GCIH1AONGKX7QZM',
'GCIZ6HN5PK8F7TG',
'GCIZ6HN5PK8F7TG',
'GCIJ1Z305BIDP7G',
'GCIJ1Z305BIDP7G',
'GCIY1ZR4L26CBHX',
'GCI5Z9GXTYF7H3I',
'GCISBPN5Y9ELTCO',
'GCI8GUP1NELMZI2',
'GCI1TYMC6SXAJ2F',
'GCI1TYMC6SXAJ2F',
'GCI1TYMC6SXAJ2F',
'GCI1TYMC6SXAJ2F',
'GCI1TYMC6SXAJ2F',
'GCIT7XNOPVB8QK5',
'GCI1E3RHQPXSWCO',
'GCI1E3RHQPXSWCO',
'GCI1E3RHQPXSWCO',
'GCI0QAYJFLEC3T8',
'GCI0QAYJFLEC3T8',
'GCIITNLQUIT7LF5',
'GCIQX0V50LRNUL8',
'GCID5KVTAOMZQHI',
'GCI18A46IDYDB87',
'GCIF11JJZ8EJ1SY',
'GCIJHHVT5X92W0K',
'GCIL8GKM7WCGSM0',
'GCIM27FRBWTCH6W',
'GCI92Y7CTNR1JU8',
'GCIB1WXGF6N3H20',
'GCI7B204IJ8NVPM',
'GCIZBHDX92ILYNM',
'GCIFWC1LQ07J28V',
'GCI2JN9DPWGH84I',
'GCIGDB5CYANLP3R',
'GCILEG9PFSXWBNV',
'GCIPZUV60WDOC3G',
'GCIM94MVRWXZ5ZJ',
'GCIPYSHEMUCVJND',
'GCINRCKYQEU7O85',
'GCINRCKYQEU7O85',
'GCIFXOMDT02JYNK',
'GCIFXOMDT02JYNK',
'GCIQEBINL0P7YW1',
'GCIQEBINL0P7YW1',
'GCIPRBNTQX0VJE8',
'GCIND1E6AT20CJL',
'GCIMPBAO7YK5648',
'GCI2DPOQ7BVJ85E',
'GCIA94Z0RR70HOW',
'GCIZFEC963XSW4V',
'GCIFV26PMNL3CYD',
'GCI1SZ52IK5EQ3X',
'GCI6S9QAKZST2II',
'GCIJ5JZGLEEEWED',
'GCIJUUY8YAKGVRI',
'GCIVPZHRFH5UZQU',
'GCIWDPXWDA89IYT',
'GCI5LI06XOCBAND',
'GCI3YPBZD1LQAVK',
'GCI0AQNJU5C4O8Y',
'GCIMJ4U7E3QASHV',
'GCISMW0L52EYDB8',
'GCI9WK2X4UM07VF',
'GCIQ8GUB7FYD30W',
'GCI4VRYB6XKQTWE',
'GCIO9QHAJNKUYWT',
'GCIO9QHAJNKUYWT',
'GCIK3GZ80VAMPIN',
'GCIK0TOLIFA5PDM',
'GCIIRB5OXKEP6NV',
'GCIKIQYCAT7532U',
'GCIKIQYCAT7532U',
'GCIHJNAGEBULX54',
'GCIGKPXIAM9WV30',
'GCID6IROJ41KBXN',
'GCIKMYIZVBO5ANP',
'GCIKMYIZVBO5ANP',
'GCIKMYIZVBO5ANP',
'GCISOIGUJD73BYT',
'GCISOIGUJD73BYT',
'GCIQCJF5S2L0AYU',
'GCIXCYR3IM20W4F',
'GCIGNKHUOY9WEV2',
'GCIPQDIKEASVUGO',
'GCIPQDIKEASVUGO',
'GCI68AEVG0YQO1D',
'GCI92TV4NU0HGYK',
'GCI92TV4NU0HGYK',
'GCISCDIHP7WMUKB',
'GCISCDIHP7WMUKB',
'GCISCDIHP7WMUKB',
'GCINLW8U1PVORDH',
'GCIKEDZH5VAYMPU',
'GCIKEDZH5VAYMPU',
'GCIKEDZH5VAYMPU',
'GCIKEDZH5VAYMPU',
'GCIKEDZH5VAYMPU',
'GCIKEDZH5VAYMPU',
'GCIKEDZH5VAYMPU',
'GCIKEDZH5VAYMPU',
'GCIYXJ36HP1TASO',
'GCIYXJ36HP1TASO',
'GCIYXJ36HP1TASO',
'GCIYXJ36HP1TASO',
'GCIYXJ36HP1TASO',
'GCIYXJ36HP1TASO',
'GCIW1F3YV9TICAE',
'GCIWQYLPAUZB23S',
'GCIWQYLPAUZB23S',
'GCI7B6D2QZW9AK8',
'GCIESZ6DMRAQPKN',
'GCII8KXWS5QC7PR',
'GCI96SCY045DVIL',
'GCISWZC47QIJLTX',
'GCISWZC47QIJLTX',
'GCIMT7Q34RDXJ1C',
'GCIFW4JDNQUOTX8',
'GCIFW4JDNQUOTX8',
'GCIFW4JDNQUOTX8',
'GCIFW4JDNQUOTX8',
'GCIZ3NEHJDKGWM9',
'GCIOES6HF0BT185',
'GCIOES6HF0BT185',
'GCIXC63RUNZ1SQI',
'GCIRX0OEN9YPCZH',
'GCIRX0OEN9YPCZH',
'GCI95ZMCQSJA4NU',
'GCIB8T1QARMOY0S',
'GCI6HCXTEW2IV5G',
'GCI5N1CVJTLQ3WI',
'GCI5N1CVJTLQ3WI',
'GCI5N1CVJTLQ3WI',
'GCI69L3OUNYIJRM',
'GCI69L3OUNYIJRM',
'GCI69L3OUNYIJRM',
'GCI69L3OUNYIJRM',
'GCI69L3OUNYIJRM',
'GCI69L3OUNYIJRM',
'GCI69L3OUNYIJRM',
'GCI69L3OUNYIJRM',
'GCI69L3OUNYIJRM',
'GCI69L3OUNYIJRM',
'GCIIGS6MJL02AEU',
'GCIR9EMUAWG5JD8',
'GCIGEJS8FNTY92K',
'GCIGEJS8FNTY92K',
'GCI7Q5O8ZMA2DPS',
'GCI1GYOK07A4RJ8',
'GCINR8I1PTZF7CG',
'GCIQM74TO25UB6W',
'GCIKVEMRLOH2GAT',
'GCI8CMYF36HQPUB',
'GCI0IRZOWCYDNE9',
'GCI0IRZOWCYDNE9',
'GCI1E28NMV23Z2S',
'GCI5BN87FNEESBY',
'GCIAQSJ8MVK5MKA',
'GCIBMRED6VY3OWY',
'GCIER82BI673UIP',
'GCIGZQWZ2DBBPME',
'GCIL8I9OE212K5N',
'GCIZPO2G5NPBM5I',
'GCIREQK0TPI89NG',
'GCI1G7KQR4FO3XI',
'GCIICXTDZ91L24Q',
'GCIBK24FERA7X1Y',
'GCI24DOEGJ9WTSZ',
'GCIT5H2EOIQGDFP',
'GCIW0D9EBPM6JY4',
'GCIW0D9EBPM6JY4',
'GCIKYH0L1RJMGB6',
'GCIYU5ADRTQGEF4',
'GCIPMSTRDG2ZJ87',
'GCI8UA2NYW96RE7',
'GCI8UA2NYW96RE7',
'GCIJQPRT71L6B83',
'GCITNZ3RGFE8I6B',
'GCIV49LWSIQEROH',
'GCI86LTHDGYFQR0',
'GCI86LTHDGYFQR0',
'GCI83VXPU9CIE4A',
'GCI8BAVTR7FXPGD',
'GCIFVORBM2T6I8X',
'GCIC64QKJNU9IHD',
'GCI23ZY76HEC0OR',
'GCICZKXJ8AM3FRY',
'GCICZKXJ8AM3FRY',
'GCICZKXJ8AM3FRY',
'GCICZKXJ8AM3FRY',
'GCICZKXJ8AM3FRY',
'GCICZKXJ8AM3FRY',
'GCI8PFE7ZT3H21U',
'GCIZ9KVIRNOLWJC',
'GCIZ9KVIRNOLWJC',
'GCIZ9KVIRNOLWJC',
'GCIZ9KVIRNOLWJC',
'GCIV4ENKL8O3RZA',
'GCI5DQM8YPXVUT3',
'GCIAPI1Y0N83FCH',
'GCILYANDVXR73FI',
'GCIOR3JGMU1DKH0',
'GCI5OKP2IMG3LZD',
'GCIWPVFH9BC84EO',
'GCIQ57UYSDOGKER',
'GCITDN1ZG6HMIOP',
'GCIYIVFU03B1CZD',
'GCIYIVFU03B1CZD',
'GCIZAURXG8IC0O3',
'GCI7PZBGXXKP36Y',
'GCIW25QO5B4AJQU',
'GCIYQX4298AKPNT',
'GCIYQX4298AKPNT',
'GCI9R4VSLAU7Z23',
'GCI9R4VSLAU7Z23',
'GCI1ULTJK5ZX2MR',
'GCIEYSXZ4LV6N2M',
'GCIJVM10A4RNLUG',
'GCIE8SBR7KFZXTV',
'GCILA7JBQV4Y5IU',
'GCILA7JBQV4Y5IU',
'GCILA7JBQV4Y5IU',
'GCILA7JBQV4Y5IU',
'GCILA7JBQV4Y5IU',
'GCIIEC0SV2HWX3Q',
'GCIJ0KLF7E3NF6T',
'GCIDEQAXBLIC7HT',
'GCIIQXKUSA5O3GB',
'GCIIQXKUSA5O3GB',
'GCIIQXKUSA5O3GB',
'GCIYRNKPBQEL439',
'GCIQL8EGT94AZSN',
'GCIQL8EGT94AZSN',
'GCIQL8EGT94AZSN',
'GCIT5OFV0EJR631',
'GCIQJTHXCUGRL3K',
'GCIPQYGRZ2357MT',
'GCIS1FZNMKIP4DQ',
'GCI90LMWR7CHBAD',
'GCIFD4C785JLOBK',
'GCI2DXHGKO1WTJ9',
'GCI2DXHGKO1WTJ9',
'GCIM6TIYFEX49AP',
'GCI0DALJBXSZ6Q7',
'GCIUX8BP1OG79Q4',
'GCITBXWDU1SMYKC',
'GCIS4RPCF3V2UO8',
'GCIBJ9ROG78DS63',
'GCI5XTODZUJA2WY',
'GCIUBVK90JAW5I8',
'GCIUBVK90JAW5I8',
'GCIO3FQZKXAW7UH',
'GCID2IWLHBSFAJQ',
'GCILGWEYZOIC7R9',
'GCIEPZOWANKLDJY',
'GCIEPZOWANKLDJY',
'GCITZEGQXYHALR5',
'GCIJ032W7AN5L8S',
'GCII2XYVN4ZRGUH',
'GCIU7CL234DOXZK',
'GCIPEX9CGUWF2AR',
'GCI870EG1HWPXM5',
'GCI870EG1HWPXM5',
'GCIDM45HXFGJ7KP',
'GCIDM45HXFGJ7KP',
'GCI53EHN87JYL94',
'GCI53EHN87JYL94',
'GCI53EHN87JYL94',
'GCI53EHN87JYL94',
'GCI53EHN87JYL94',
'GCI53EHN87JYL94',
'GCITV6UA3E5PB2W',
'GCI721GFNO5R9JY',
'GCI721GFNO5R9JY',
'GCIGIV3JES51RKX',
'GCISM8W9COVF3G2',
'GCI54M0SHQC92O8',
'GCI54M0SHQC92O8',
'GCI54M0SHQC92O8',
'GCIJRV6N8ZHFM3O',
'GCIITW1SO78YGU0',
'GCIITW1SO78YGU0',
'GCI03SBI5H96LYP',
'GCI6R9JHNVP4BL7',
'GCI6R9JHNVP4BL7',
'GCI6R9JHNVP4BL7',
'GCIK6XPW947YNM8',
'GCICNSGQ5RO9TAL',
'GCIF8G9MBV273X1',
'GCIAKJ9BFEYDCRU',
'GCI4UKJFB38THNZ',
'GCITOM2XPRLW7NJ',
'GCITOM2XPRLW7NJ',
'GCIOJ4M63UIE9YN',
'GCI7QYL25KM8FER',
'GCI0TIWAEJ5C4S1',
'GCI0TIWAEJ5C4S1',
'GCIHYR5OWZNL1FE',
'GCIHYR5OWZNL1FE',
'GCIFD31R04YAZLU',
'GCI6MPU3T2BR5K8',
'GCIL15BHJUESWYF',
'GCIL15BHJUESWYF',
'GCIL15BHJUESWYF',
'GCI53GHQAOWWY2C',
'GCI672Y2K6OL8PN',
'GCI7SDTXM4EJ3OK',
'GCI7SDTXM4EJ3OK',
'GCI7SDTXM4EJ3OK',
'GCICGYJU4EDKVWP',
'GCICGYJU4EDKVWP',
'GCIMN27DNHXJYRV',
'GCIOSFCGA35NP9T',
'GCI9EKMJLP50U1R',
'GCIPL2N9KIEFYUH',
'GCIBHWV7ZT1U68Q',
'GCIA16L7N4USZG2',
'GCIA16L7N4USZG2',
'GCI4Q7NJVMPI2BA',
'GCI7LTGEM4UZI09',
'GCI7LTGEM4UZI09',
'GCI7LTGEM4UZI09',
'GCI7LTGEM4UZI09',
'GCIY5TB1EPMLHX3',
'GCIY5TB1EPMLHX3',
'GCI6AL2GY9TOFDE',
'GCI6AL2GY9TOFDE',
'GCI2WVLMN0SUD94',
'GCI6FI1O79VWLBD',
'GCIHK1BQ0OVIYX2',
'GCIGVIDO8LHRQE9',
'GCIGVIDO8LHRQE9',
'GCI6ZKTI93ONBWA',
'GCIP5DISTLQOKZ4',
'GCI5AZ7NI1JRG0P',
'GCIWV8HA3IYQ7ML',
'GCIOMNHGE69Q7IT',
'GCIRK18P2WHNMO0',
'GCIBM69G1YL5HOE',
'GCI07CU1B4JKHLI',
'GCI7ZPL0BG6NE2K',
'GCIAI1CTO9RHN65',
'GCIAI1CTO9RHN65',
'GCIOT0J7LAHG4E6',
'GCIOT0J7LAHG4E6',
'GCIBNO4MDC56VEU',
'GCIBNO4MDC56VEU',
'GCI4KJ8XRZB56DM',
'GCIWG9MC57LAPVX',
'GCIK7US30OZ4TF1',
'GCIUMP7W2EF98QK',
'GCIHGP1Q4YCON5R',
'GCIBN3PHEV6U1QT',
'GCI04F6ZK5JDC1P',
'GCIU3NDPOA9VB5M',
'GCIGMP2DAYW0F1E',
'GCIGMP2DAYW0F1E',
'GCIGMP2DAYW0F1E',
'GCIGMP2DAYW0F1E',
'GCIGMP2DAYW0F1E',
'GCIGMP2DAYW0F1E',
'GCIGMP2DAYW0F1E',
'GCI5HIJMXNRW69P',
'GCIDJ59U6REVOLQ',
'GCIMDFVOIX5382T',
'GCIMDFVOIX5382T',
'GCI5JT42V5M74BA',
'GCI8CMPVLS85496',
'GCI95DBUW5ATGNV',
'GCIA44121JNRDNA',
'GCIHOC6DFHRSWO6',
'GCIOCSZP43T68O6',
'GCIOESY28PYC2BW',
'GCIPX70O5PTQ9RC',
'GCIS0K35G7Z6M3D',
'GCISQQU4BMBQ9ES',
'GCITS026M7XT0SV',
'GCIUT6ZGFBO9QKS',
'GCIY5Q8MJEVFW8D',
'GCIZNP2KT8EV0DA',
'GCI328SC2CWPXWZ',
'GCI34SHSTLFQ74W',
'GCI3JETEB3E4O4H',
'GCI7ZZF6Z74C6D5',
'GCI88VA3RML4W5O',
'GCI89BMC4BDAIB5',
'GCICO5LKIUXAFWB',
'GCIDCD7E9Y6Z158',
'GCIE56NS93KDL1T',
'GCIHMRB5PU26S93',
'GCIHUQNT6IIBRQ9',
'GCIJ1P4JJGJ8AB3',
'GCIJGP6JUCXPF2J',
'GCIKT6CFWW0SW6T',
'GCIKTO6SZWM6NI3',
'GCIL8931I6295AK',
'GCILFTOZFH8ZXSV',
'GCIOAR15A316F49',
'GCIOSVZEDMIQYVQ',
'GCISM861DC2FW9G',
'GCIVJ7VMVJW1SG3',
'GCIWTOA2W2HRM1L',
'GCIYXRD17IUMJDA',
'GCIYY0ISZS1RFA2',
'GCIZ37L3YSW8BW0',
'GCIZM6O58Z95X6U',
'GCIZT04ALKUF2B0',
'GCIF6QOEKBH4ZUX',
'GCIF6QOEKBH4ZUX',
'GCIL4NWSC80UFTB',
'GCINXKY9Q18S6UH',
'GCINXKY9Q18S6UH',
'GCI3JO2GY8VZT0H',
'GCI3JO2GY8VZT0H',
'GCIV3B9UYEXG75T',
'GCIFVYI51GTDEWM',
'GCITA59QBX26M70',
'GCIBTYO97ZCI65L',
'GCIUQCO6YJLZ0DT',
'GCIUQCO6YJLZ0DT',
'GCIUQCO6YJLZ0DT',
'GCIUQCO6YJLZ0DT',
'GCIZEDGN0JS9OWA',
'GCICZ2H7INAJ8UW',
'GCI64HD5LW9TPVA',
'GCI64HD5LW9TPVA',
'GCI64HD5LW9TPVA',
'GCI3KWGIEU12NP9',
'GCIESFOUG7WXKVM',
'GCIMBRZQHSNIULV',
'GCIGPC136NLS4J5',
'GCI4Q0X25IR3NE1',
'GCI4Q0X25IR3NE1',
'GCINK9P50O7RXJH',
'GCI25M8INVXGRQ1',
'GCIHX1VC56QPOWT',
'GCISJGMXOY48T9W',
'GCIDY16VO7IHMC5',
'GCI3UH0FCRY12K8',
'GCIQIK4FL3SRYU8',
'GCIL1EITS0F75KP',
'GCIL1EITS0F75KP',
'GCI2DM7BKDKQTRY',
'GCI5BB2MSZKOLMF',
'GCI6PC9HE5IC9PT',
'GCIALWFK46CVXHT',
'GCIAHUWQ7X25BMD',
'GCIAHUWQ7X25BMD',
'GCIAHUWQ7X25BMD',
'GCIAHUWQ7X25BMD',
'GCIAHUWQ7X25BMD',
'GCIM18HQX206GDY',
'GCI14OZPRXDQN9I',
'GCI14OZPRXDQN9I',
'GCI14OZPRXDQN9I',
'GCI14OZPRXDQN9I',
'GCI03ERZYAKMEYC',
'GCI0ALIIE3J3RDT',
'GCI0KSR52L4366T',
'GCI0NIQVQTXMEL3',
'GCI148IIEX5OGM9',
'GCI1CKR6PQ5CTSC',
'GCI1HA57ZJEWLE1',
'GCI1KNOJJZ7UCDN',
'GCI1MBOIO459HJ6',
'GCI1Q9KFAG62501',
'GCI1RK9NAESLG5V',
'GCI1S1TCOOQW0QW',
'GCI1S33ONYHQWRF',
'GCI1SD2NCDEQ91V',
'GCI1V48WSCUWSTG',
'GCI1ZOOE7Z6K6XU',
'GCI1ZR08QP4MTPL',
'GCI26U36VX71CX5',
'GCI2BTINTI8J7I3',
'GCI2H5VLVF9Q1K3',
'GCI2KTFTQ55YDQZ',
'GCI2L4GW5QYOU9Y',
'GCI2PRV231114CS',
'GCI2W3AJH8OV1OX',
'GCI38AM65M19EOW',
'GCI3CPBCIFENYXO',
'GCI3N17E448QVLY',
'GCI3QEP4UPL4UXN',
'GCI45GJSY663VO7',
'GCI45VCFSXINTKZ',
'GCI47R6AELIM2JY',
'GCI49OI90E28RHG',
'GCI4FS2GOSZ0G6C',
'GCI4GFMHB6BM0EU',
'GCI4WD699AA5ZAR',
'GCI5I2G0KXJYQNV',
'GCI5KVT0W5JRRTQ',
'GCI5L7GS7VL90YJ',
'GCI5Z974CFJU9AW',
'GCI61N9AUKAWV2N',
'GCI6A1ECXPIV3A5',
'GCI6F2Y8HX163FV',
'GCI6IOL6S1YX90Y',
'GCI6ORJP9VCBEOD',
'GCI6V7TK4WDW0HF',
'GCI748M5FGA1ADJ',
'GCI74K82GS3MV9O',
'GCI75KPJPKTTK8T',
'GCI79MD0VY7649C',
'GCI7A4BTRP205UN',
'GCI7CF2CLIHM6BB',
'GCI7CPSEMJUXSWA',
'GCI7PTABPYWGCRB',
'GCI7Q03C01963EE',
'GCI7Q8DEQOGOHJL',
'GCI7RYL4F5HWL0F',
'GCI7TEC6PKMBVKA',
'GCI7XQ8S6HS5SA9',
'GCI81FSFVP76NWG',
'GCI84ZGD3Y05JMI',
'GCI8530W37UHY61',
'GCI85X7ZZ5VAABU',
'GCI89BFENVHCBSJ',
'GCI89IUC6SWZOIR',
'GCI8AV5VVRKY8RM',
'GCI8HOAH9ER2DL4',
'GCI8M57U1A3PBXB',
'GCI8OMSBADR04Z9',
'GCI8T1TMVJ75Q00',
'GCI8V2V5FXXAXRL',
'GCI9BL6WH87BM51',
'GCI9CBJJ21HD93Y',
'GCI9CKVE10NGWSQ',
'GCI9DS2A11AOB5Y',
'GCI9HKUB8ENURAY',
'GCI9KJ7UR8AYV1B',
'GCIAAVAGJ6JI2Z2',
'GCIADETUC1R8AF3',
'GCIAK9GLP73UP77',
'GCIAQ78B2QX4S76',
'GCIARX6HFW1PJ3V',
'GCIAYV8WP89OWJC',
'GCIAZTKLBCDCXYS',
'GCIB00IXXWHXR4X',
'GCIB72EYRZ8SRTJ',
'GCIB9YUT0H4NESL',
'GCIBA8FGA4XOQUV',
'GCIBXWPLT3DFEIV',
'GCIBZ3TOEHQCI0J',
'GCIC0LTUWRCNDMX',
'GCIC1B309XN24VI',
'GCIC2Q748201U48',
'GCICBBVM3D1DVQ9',
'GCICCZNZO463SVT',
'GCICHZOGCOVGDVW',
'GCICISEJWTGY6J8',
'GCICIV9HMF01N5M',
'GCICP0Z51DIU0I1',
'GCICTQAH0TJG75M',
'GCICTYU8JO5BKNY',
'GCID8NMR2UFIF38',
'GCIDB6RJLR75JZO',
'GCIDHOBZA956PTY',
'GCIDLW9MVXCX8ZN',
'GCIDOCGQR42MADC',
'GCIDRYUC4FUIEOC',
'GCIDSJFPA2SCRCY',
'GCIDT6447GDYN6C',
'GCIE0JPWGA252CE',
'GCIE7UDCC817ILD',
'GCIEIG8U55DLW03',
'GCIELRJXFMIX87X',
'GCIEO6S204HX46E',
'GCIEV39OTK84PZE',
'GCIF14O3E9G6BDK',
'GCIFC57JKUD0TMP',
'GCIFIU56S6RSHNN',
'GCIFJ93S7ZWI4S4',
'GCIFNY8CC0QTGA9',
'GCIFPFGUDI2EGTH',
'GCIG0TTER7BDJGP',
'GCIG4U9R7M2AV7A',
'GCIG6FDWJYTJBCL',
'GCIG8W817ZVTV54',
'GCIGFTJ81YW13UK',
'GCIGIOPPXC1UHPJ',
'GCIGJ8L0C9WKMS8',
'GCIGOQYCLQBN5P7',
'GCIGWVQAQ25NH9M',
'GCIGX1KK2WH4O02',
'GCIH0MWUFHHX3O5',
'GCIH2NJDTDZD418',
'GCIHEXTZWBULU93',
'GCIHTQX5TF6U6MY',
'GCIHZ5CW407T9SA',
'GCIHZRNGGVLLQKD',
'GCIIABANO3RN3S3',
'GCIIERTBXT8Q1RL',
'GCIIF7AUK3QETC1',
'GCIINK2V6D9TR63',
'GCIIU3Q7106N463',
'GCIJ572SNF6YM1V',
'GCIJMOIZ5DVHDP1',
'GCIJNPZ8PBXY2Q0',
'GCIJQ5XW7CZSVMH',
'GCIJQXHP8OV91T7',
'GCIJSVF7C75SZE7',
'GCIJXBHC0RZJP3Z',
'GCIJZ8CJJZ5EF7L',
'GCIK5AKWIU71TCX',
'GCIK6GQUIJK2CEG',
'GCIKAMA8KYLAJU6',
'GCIKC2767AHP01P',
'GCIKDNUVNAP0VTU',
'GCIKE0QRKSBBXDB',
'GCIKHNE38BOJJ7A',
'GCIKHRNBWQ9LNT1',
'GCIKKA5MN9ZD6PZ',
'GCIKQU38FHLUKAN',
'GCIKSVCFV2864W5',
'GCIKULD7QU4ES38',
'GCIKWVI89Z0Y9S7',
'GCIKX338AZB5BIK',
'GCIKXFB2L0XA2KN',
'GCIKYS41OEUT92N',
'GCIKZ4Z9TNHOR14',
'GCIL0GMKYXBMF9L',
'GCIL0QQOZO4RY15',
'GCIL6FUAJAUV1ZC',
'GCIL93ZID4XUAVC',
'GCILDZRJWL97PQ0',
'GCILEFTIPU8V5EC',
'GCILJWZYHMEG58X',
'GCILK5U5T40KWTY',
'GCILOWU5UA8P9W0',
'GCILPXXB0O6EW5M',
'GCILWCGWX5HNVSZ',
'GCIM72SX2WUJS1N',
'GCIM9NWXZRBE293',
'GCIMCLTUI5WXSTY',
'GCIMGNSZ8MP18X2',
'GCIMMMQNOBDVCV2',
'GCIMN4DTV6AX7FG',
'GCIMNETZ55YI5XI',
'GCIMQW78HS0NW8C',
'GCIMZBXEYV0WQMQ',
'GCIN2IRGEECV8DU',
'GCIN7QMU25CY3NQ',
'GCINBKE82W2GPPU',
'GCINFT8ZJ0XO7JY',
'GCINTJODR8HIB2Q',
'GCIO36I6O1KWBQB',
'GCIO84D7HWJQT9Z',
'GCIO8XV4XYFBKIR',
'GCIOFFKHFOQCS3W',
'GCIOPJSAXZEMOWA',
'GCIOQKWYJWFCEM6',
'GCIOW2VG2NT8OXK',
'GCIOZQEEGPZORHZ',
'GCIP1X997HIRJDV',
'GCIP60AI9UURL1I',
'GCIP73KEN1OFN15',
'GCIP8LEURRYWKVC',
'GCIPJ1LE3RPGDWH',
'GCIPLMO3B5RC9ES',
'GCIPQKMZK1HEEG5',
'GCIPZ4J4AQGQ3UP',
'GCIQ3RCJEAOH61L',
'GCIQ455IKF38S13',
'GCIQ6SIITYPJ6DM',
'GCIQC05PGSIUY42',
'GCIQCQ62GF7A9KZ',
'GCIQK0F7YZSZ0EJ',
'GCIQKQOLM4VGV4J',
'GCIQOJ0NTXUUDVY',
'GCIQQ1577BOEFIT',
'GCIQQ9BI8QNZKMH',
'GCIQSYKPNFWMUSC',
'GCIQUZY3Q2A4FWZ',
'GCIQVR4NZLP4TZS',
'GCIR61IC2VYOEFI',
'GCIRA5K1CYNUAVH',
'GCIRKWHZWGU6E0H',
'GCIRU7L2LYPKIAP',
'GCIRUQJVKOUYT1G',
'GCIRYM64A0PZQ9H',
'GCIS2S7WQX5EPO9',
'GCIS3T8SO85701C',
'GCIS5T4XR2TY8D0',
'GCIS7GATA41ZDU6',
'GCISH3O4YBRRK03',
'GCISKMHAWE1WQI4',
'GCISO33U2537AGS',
'GCISOWX1SEAKY78',
'GCISW66O2XVAAOS',
'GCIT5AAO0K96JKR',
'GCITHACAH8R5M45',
'GCITHT819N405RK',
'GCITK3PWRKWVBDL',
'GCITOTIKZ1EVA6X',
'GCIU0MC3ERWDK1B',
'GCIU25EEFVPVPIA',
'GCIUK39ZM1XIJCI',
'GCIULS51LAF4UJK',
'GCIUM3WS85IZHNO',
'GCIUTL6E201BV5K',
'GCIUXZ7ZVHFDNXF',
'GCIV30EK5K8JD0P',
'GCIVAR4Q3SK3GGP',
'GCIVBXAY5R2IXLK',
'GCIVDXQPIITMJO3',
'GCIVK7MSMRHHHCL',
'GCIVLK381NS840N',
'GCIVM88HA3CQ7B1',
'GCIVPD4DEEZ7T3J',
'GCIW13JQWMFZ1HA',
'GCIW577UEO4UAQ3',
'GCIWCW46DBHCXIO',
'GCIWEWUTIXON3JE',
'GCIWJMEOFOIAS0O',
'GCIWMH7DYGS3JYX',
'GCIWOXP4LLHMLIN',
'GCIWTHC9FCSPCP3',
'GCIWU4F48H2ZLKP',
'GCIWW2YMHGIJ5N7',
'GCIWZ301LSAGXAD',
'GCIX8P7A4MSV73W',
'GCIX9HGCX18O2ID',
'GCIXE0HF47OENO9',
'GCIXPL44ZOPSRSN',
'GCIXYZP9GHNQ9GW',
'GCIY0D2E6XV3R3X',
'GCIY5JGE4CIFD47',
'GCIY7ASVFOZB1YE',
'GCIY9SNR630BLWA',
'GCIYDB581T4Q2N8',
'GCIYNP982RWRNHM',
'GCIYV944TOT9P43',
'GCIZAK177LTWZWA',
'GCIZET6EFAA1GN2',
'GCIZIAH8L8RIUYY',
'GCIZJSR3F1U8Q6Y',
'GCIZNMTH9TFCYVV',
'GCIZNQX1A9QLOC2',
'GCIZNSE3JWN7M91',
'GCIZPGUIH17L31B',
'GCIZQK4E6COH18B',
'GCIZSCQIRV5QPRR',
'GCICPU9FEJS3D5Z',
'GCI7N20H4CZXPW3',
'GCI7N20H4CZXPW3',
'GCIP68EOAC1JX5S',
'GCIP68EOAC1JX5S',
'GCIO60VGLJU15EZ',
'GCIO60VGLJU15EZ',
'GCIYHZBP60LX1K5',
'GCIIXWF0DKJG3U7',
'GCI09BVDZP8RJ2C',
'GCIQ9X7VN34EZLY',
'GCIV4PY9WRKYWLS',
'GCI16DLKSPLR9N9',
'GCI2CY2RAQV7QUW',
'GCIF6CTQJR5XBL7',
'GCIJ20DUM8Q98WV',
'GCINUO1LD9V0NLR',
'GCIQ61BJMIXFRZ6',
'GCIS9QVOORVH7PB',
'GCIZ8WMG4LQO902',
'GCIA3Z4E0QVI91L',
'GCI9IQJ8TLOVXW6',
'GCINGOWATPZB0F3',
'GCIQA9XIWL1S0Z6')