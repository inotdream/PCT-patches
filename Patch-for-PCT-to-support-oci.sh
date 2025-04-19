#!/bin/bash
# Make by lurenjbd 2025-02-10
# Edited 2025-04-17
# Patch to make PCT support OCI.

########### Variable ###########

MIN_VERSION="8.2.0"
RESTORE_MODE=0
SKIP_CONFIRM=0
LANGUAGE="zh_cn"

# 颜色代码
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' 

#  Patches BASE64
PATCH_BASE64='
H4sIAAAAAAAAA+w8a3faSLLz1fkVHcIOsIBAPG28Tpx1vHtyzyaZM8nk7rlxwgqpMRqDpJEE2BN7
fvutqn7ogbDNTJK9D+skIPejuruqul5dTWDHzcCK7Vnru6/2tOEZ9vv0DU/+m97NPnyavf6w3/2u
bZq97vA71v96U0qeZRRbIWPfhb4f39burvr/pU+g6b9v9IzLr8IFO9C/2+8Ngf6djtl/oP+3ePL0
D3g4/9J4J/oPhzvQvz/omd+xjmG0bH+x8L2vMi3xPNA/Q/+foy8/xu707w3Mbob+X2Na4nmgf4b+
80v7i4/xO/a/ifo/Rf+vMS3xPNBf0l9i+iuMsYv+75pt1P9Ds/Og/7/Fs0F/0rRflgt2on8H9393
2Dcf6P8tni30/+H96fgf/zwZv+XxMjCCheG40+nvHQMJPOj1ttG/M+hr+ne6XaT/sI/2X/tLLnTb
8/+c/s1mk7WWUdiKZlbIE+q3gPotTf2JdbHXaXf6zXavaQ6ZORy1B6P+0NjvHAyH++1hm9Xb++32
o3q9fje0Ykh9NBEO+gcS0vExa3bajQGrw+eQHR8/YsuIM4A1GgGw0YigjUav3cs3bw+3VL4JuHe6
nPNwW4OfvIXlWefcOXxUL4Zgu9D3EVtcsXIwX567XsSO2OdHDB9rHrgex7ejp6yy0fc5VVcatJZu
D9fS7cu14LOcLL14ubX7T1QN3amx5176EdvamNCg2i7VqrYAVtXQvo7tfdtlbDtswAFCviFEPGEW
W1gBi31Y/txfs2gZBH4Yu945C/ncimFUx43i0GfTubXyl2FE6x/gyuuDYeOA1r93I6YKX4+a+OJO
WbU5ZaUy7jPHDVs8tlsOn7iWN17xMHJ9r1QDxNd1YyfV2Ar4pajeC2HSocdKsKjSoWh+w/g8uucA
DNaoYYhqAMPuArNa5uaZBoKVAESwwT7iodvvSETgA8xVLUd8Pq0Bbx2PCc+yvOxYsQWlVN18GoR+
zG3A8dgG7Fej5QSGau7JSVVoMn7UBEJwK+IVgRFdCyhp2r43dc9lDQ6ipvnyxZFE2V56oYUwWbon
8cs7359Ho9HUnfPxOY/HMEzMvTiqbvY/ROpnRkCBMXcnf2iUIhgS5f0DQjlw4ECjXEL9vhxYYcTH
fjSWvaqEcZwkseYTdjLj9kXE1jMez3jIWtHE9Vqu58bMjWAvRFeLuetdNJjlOciXVN4A+JE/X/EI
/4atAl2ZZcdLa86guxVePWJIO1pDPEZoY1DCMyVYChjia8n/O/T/CbHLHzQAbtf/Zq896OT1/6A3
eND/3+K5Vf8n1N9uAAzRANg372MAaHDFoHp9tAD2+ykLoHuwT2oTvsz9/OYlkfAfb9+8fmvP+MIa
jYIVRxnsTq/GblAtW44TNljZ83kYqg1dR5kqOH288EHBjoVAJKUulGEQgwyHjQq60JQKMr4KOOlG
0Gug6JTedHhkhy61x9rSCz4FhR+J3b6M/YUVuzajYVA9TvjMWrl+yKbwPwq47U5d0JYozaKrKOaL
yChJyLAjYx4S1F/C1qdq6F8v3EvuXIfrWrkFjUAZ18ViaCBaCU4nWQeoChv7F61WjgKj3tHCPg/9
ZXBLoxttHU25BVThUTINIcqwPQL4TATtdUwkKPh5DbMvLAFsZZTYa9BsgDkL5OUMJOvanc8Zvwx8
sMpwKdOIJCxMGd6U3Gf+lJA986O4lICSAvd8yaMYUSq0t1wS4gtUsphSfS9P7j1N6wkoG255SOw9
h0+t5ZzW0RZ/Zyl/EsLqOUNDAKyfEFS0H14ZJaliYUrA/mJJmi9Af18xW/SbWBEwCnR2bc48mB7o
DY/WsB3iO8QS/LPDpe3C/JGpuBctkUEFHq0gmMM4OEnEJ6BVwETsWcCoYQqabXmgoGweEfcCzsVk
IsQ9buIrzZo3Ep8X/MqO5wKNLI9GVoRGov/+AJUxGPspQxioJ1vfDkrvvuYe95YLLPvwy7oqrDQm
7CxlVdvAH2AwT7njhxZsakQNLMsK7Rno6+WlMt7PsZ0vzWttONc+IpW/ziBobWcGYhvs9OYtiRxD
ExmgOsjWEVrkTOy+ZUikBU6JXIdnKSvMEdsPYUMGvudE2Hl+aUsAYjRispSwhvqWAN36iyDJU0Ps
egOLDfbemi85q+jJV4htJjyZ3oUb0MiwACng5JDpbUjfABEsJJ5Ihv4BSYaB2Wl0pGTQ+K9EMz6f
VxqsIrvhaxxfVST29OakwvyGD8DGW8Du2Lbj89h/rjoA76NwNthzjzYwFFsLDoIZEOfQzlJbLYN8
RAdKK9rrTaA9D8ktArjP03AbzLnyrEVaFJCaIGEgN2MI3isRj7Y2B2TasMPjKyEMhesFEiNcwHqS
CeCWJeagXVuwgVK8XdETRKQuPeIAD/76mBN86YZaFAh3DOxXe+HcLVJT409xzgIuqO0m8F5Tgmmm
Wm3IWWBHXDkgBFuD3HN/zbE+STpmOSvLs1G7SrWUll9aD6SU087TzineotkKe2CbOSDGi0hwp2wA
NncvYJOhzkOCQGlF7OaKUMYVg+VFsfQK5bC7iONBj+yrwf5+ShxXgBgGCDrYS2D1hxUFRNfNfP/C
kHp0szZXUc9XGPEimEZGBJTb7HyxiM43SwlnxhQs9cm2SpCw4ZWqxKUddA9waQf77QLTsQzzUBbh
hhkZ8nMXSBGOBbGrWxmUnX0vzU2oHcvasagFg7OOLt7WBspOI19vhZJVOXt1UfGEPacAy5yjLQg+
JezYCb0sPQe+Qbpz+COaWyAd4WV2FcxASjQYbH7Xd7AqsGwu7Cb+C/ieEYvccy+SIQExKPv+eybf
Hv/GWp8+WM1fnzf/q908GJ81z4yz1ll09LFebomAgeNyVnrpQXsX1YvYjHJPIB8jPXCZBqxzxHwP
5BqowJkFU4dJ2cwGRQN+MK1ic+Jb5gv6lItgE3eMM09HdRSiFE1pFVCJFSJ2wlc5a5Sc7OI9Qjyz
T1E6s90dNvpJfOZmZ04hbtzCJ1S3nUvS1RkeoQrtz+R5xQHzwo9lTK5ltBhQo2Wo77L8s6yacw+m
bAv7ssWkBpvAcjwPxlVgkU2A6mJodvQbWxy3gCeMZ9Vno9Z1uXbMrq+TeuCfxeNPBPGx6J+JyCHX
ThGkWMGhYifZG6wcWgATzCWNYSTYLSSnrpLk5A0J7OU8IYBh7iTlpdYbg42r2xUorCyVdZtxTg9U
fkCuM4sUWuWFWCbos8Ai2xtE/PlMeTBaqVFfYJIJuEPF4GUP5/7w0soQUdT5t6Oo8z8ZRdJV291Y
2JiMdBYXoAwLF5yqx1lN0OqLQZjS/ISeS81NRAJQ+FZxA7jA9+1D/P4LK796/s/xi9P3L09O32JR
va4j6GU083Dg5tPPJYJZdks3Ys/cY3EsZQclW67YBroXtrVJI8U3CkURmg1sHaNJR0fRYgLjGYzo
cmit4ROnZsdJwBTludntD0ig9wadRre/YQWAAlVWQDKgEEdpyWuDpgL1VE6LZiWIVTHOJSeUkRww
AhRykGnsc0HASqyQXOxYQa6mMZodtIaHMFoyl4/vI1/Lx3nhifPC6eKxgp47SHImGKF0mBb/jx0y
Yp0qLgWYRWyDm9q9RLvcM1K0S0hkKNAECgR70ZAkv+85opD1X2DAzg4DdnYZMMN7KWYH+sbjlT8H
SynD6Ir5QNDCp2iQ4/L9g/1GDw9Ku91Gt7thtiB4mBG37JkM321ncdxp8DUFP7DBjsnhzXE1rg05
CAV/FT4i9ifqJbDl8cuYsITVaBC0PtFg1TOnXiu3CMqeVtTIgTRy82lq71UJHtABgdwIc3cqMFAT
AGh+zadViRRpGcnpHmYkSWpjJx5f0cqLTHBJK1jPY21d6q44XBwdaqwgfsU5seWCMI6CuQsWYaOi
YSencaLJEdrbVXT0rsHLuxbuXe0oF+wVvfaCZTSTQzbAZjJH5Q6d1dFS8TSNi3bElK600JMVC5E+
EpMTXLknsVTEnT/7rletsEpDDllTrGoefrWTqIfn3/HcJ/9n/MZ2/8gR4B3nf2Z7YGbP/0CSdYYP
53/f4qHzP3TZvOV8nj+X6486+4bZP+j220Cke+f4tAS/bMnzoVM+UFPJKV+70QYbrdFp91B31QPL
vrDOtyXj1EWmjjD3ZNrO2grRbY10bZItsC2x569WxHXzCfzBfllXC1sJnYNqxOPr25SmzAiBtySd
oMAkxHP9lOJ7+9MPpz+ORgC7eisgDUNpRxGiR5td5bpk6210ILBaRs8zk4AeZFWnUktEIoQsd8+r
SpGSwlLlpI2UFlOFMJiMbd0keSXlXA2OVNCB8k0KQXJv5Ya+twDtXgAWnEsE+eGj0M6pUqXa0ioZ
YLHq8edt4G8ySvZzGhrYHx9KGNZKtS+RzbH6mFKiW9agzh4KFqCrcojR5dsxo9V6EVhdl4erK7YD
VsHyAri6KgdWl0uoe8Lv1ZhPm4kZJtrTvEUhBLSFyI4DQ1EbPRlDMDcwleUoUGhoI3sfbhiDCaNn
tnQ66YZKN7cMJQsIj07asnK/Jnvpsyyh+W1kjCVpWKWNNKzb05yKYSjMpz0VZQRnVpF3ZR6n1pSR
DlIyfFbd0dqdU2rDERN2bevMazXSOKklTXUqAO3PVHnifLiblcLPtcWJDGtnJp5mKJwH7GWaTs7n
oCripLPoz+RsbKl7QnVqAyRVsM/P0hsdmh7B/6pR14Z4Mt0V0ttUHJgTHRnpIsRFJrMuPyiKwzOM
mm8ZskiamrdCVHLkzJDHjQry2dti0BmBdDtsIuQZHejcgiJBbmyUwZR2nVLMFNWRm5IOtXRjEWvC
pEflcW3Id6wAphC+ipAd0s+CcuFnna3rtRF9avGS0C03BHlYR9LDor2lhMxWUSs8JvT28sBqyH9F
i9hOOnFQJlFrpvEqpqt3GExUNj4yS/chmRCxt7G1dMs1uQhYcgBwjfuHDMYpWE5AuOuM7kzPDBvI
aeW9VJK1FKtpMPruYNCBDBqUKgFi7YglwyL9gG1huI3vD58aH+vVZ6MGvdT+XIN3KAc1Ij5rz4Qk
UAyB8SE886JRU4xAck/GeFlJUD4xfzBbAnvRC07obCIaHxFLnU0UT+0lQAQONetkcaysL9FJH1FI
pOjCji7sNDQwDTYFKgnNkW0pA29T9Zp0yQjh5tMPacH7USOdYG6OA23q9Y1Nkde8iLKEEwRiiuyI
1J5JWufjZYWR7ePsMlLBbSJzhpM3Fux+LOB5RY8P2qqTDJ3UNmR48UiU6chkifCcLVNANjZREl7U
O6EsCc1yLbJc2xHns2ettPTSXUst8ZpIrL1t8+8cpZqm5dot65a8ricoWS27clmYW7oifOaUIU35
ZCAhKXMMmDDXhiFTlm20aRfzRYBXEMZT93IZbBh20lXT9p3uRylKY4/Haz+82KnbGFMPKX6+Uy/H
i3brELsL/qvv7TYMrIkS1XcaCYR2OMazGsCFs60rfGE7Iat1602AS49yXMcitrnqjFXKUgFcnGrG
9JZUNg/ZEza1LvA8HBaz9r2KSnmaX7HZEqAdNmupQQuy6m8x8MUoGSxEMyIrnm2OUSVF49gfq+yn
XaA9YZgqE2nPI+RjjDYh1/g78FmAk7HnQP7f1ZG25a09ZcxBExKP0wAJ6LZlgT6Ef/+vPbfHf//o
zU/x3HH/czAc5uK/5qA7fLj/+U2e2+5/3H7xY0AXP+4TFd4aC+7S7VEoSmLB/X06se9Tnrg6ySQj
SFmIaESC8rkRV8SesL+BgYi5BK4nfCyRuiBDwiNoIo/OhBeM+g2ck4qCNkJYGBvdwzwCZoApRbmK
0hk2sPBI3mIQDsoR9micJdcC1XW9J+zdjIe8ErEMBErJAuMioqxPz1832HrmguMq7gM4Ds3e45jv
izfDKC/T7Ilk6H7D7G1cmKzvyWtpZByjIm6qk2ed7AyqPKZMLo2/4pBkIXJUm1HF2OimQlqbYQP+
Cysl+cOp2FZZIDGLWDkklCd95MFkyp+QiH0Fvj7mjICM4s8UvnEWScReXC5qPp1ZUZJHp0LqlaKh
K3QiS+je7zZME/B90Gl0TM12iiMW1gUobm7D6IGKjiu9uVq4qC5FuH7pBaG7AtDnHAtTPs0mPDWb
PMA7YGzdCs3fxcDZTqlUWuijvXymXzw0QSeu5zSkR0AkbLN2ejvUi+YpwxSS67JTVTdymCkZoKg6
lTYMLTt9oTugg/TQxR0S5EE8DUncyNT94gxu0Z1/nMEkJkSOw/U4upIB8I2tUxB335UJBYoRUkUm
BOyhqGIlfom3ddwYrwLI+x0wyWwX5q94GLpO+o4ZEVbu9vTBfjbaUk6lu7PN+eYSJIpWTI5lAbeo
+J5uWpBdoINSuxEApbvoYbCTd0zdRcCLJlfRKARBOlnG4gKG4/MI/QJrvrauIgZeIHyuOQhYvA5A
kER+PewpbpwbDfVnU3p9DpvFcRCNWi1ZYbh+6+TN63fPX74+/XH88vW70x//9vzktFW8ZyQWcF6U
u3GmLnwP25SGPuzsN0yh0LLdhWfUMeR9K/j2KGoh/ib3Y4xZ06y8sH4GiVxeuOD7sLVkfNkOsFfB
ns116Ma8cqP2IkoNQYNNmhekBClOFffK6yJMl8qx0c7AXiZaVhQBUHENk+UDG2amvrNR3xEZjXsq
tvEbi64/ta6vaa8lhYtrkWp8LVtvl2NyHrJrIsJUmqOSZXJBqZwtOnSVKug/n//4+uXrv4/Yizfs
9Zt37MfTV2/en6rLivHMB1ZcCC+VbuoQW859P8jc61PQbMvDhLEJl3ccnY2MSHGPJWyt1VWgqryM
CabVIqoZel4z7olZwD/uWZM5ACMEyEuUYHfAZ8gXAFZdKwRD3439EEwVjF1Q3r3g1l6HuHXYUXaH
CpIt40jlDErZoCIfN5Q6ePKOVGEpp+qIHNDXUJ0lHKEvNkXs5jnyrgJWXT+4t3hVHXLCVV1qul20
ZtapIR1tnNcUp1wlGt0+X5nQfMFBZV9J4UdnKFSQAihbIM77ZudQNovWVpBqhH/esFYLj9EoQ7DX
PxB5sAfDxn5y7dZGI3I8gUWfg/QnNquWw8Dm3qpBEn0mozweX6tjV9g1NzWRCJktzPyuA5bQLm19
wpMMdaYrf9LBcjHtFfh4zC/takkRBPeOzvuPIpUrDHwtb5LQFRAyetEbOzsOrIU8/iwYN3+afNfI
QlwIHXnnkPmlgt1Roa3EQ+CiCpJHl0ccL4Q6Pm7AbI3aQqmfu5Dobz4VtFktaLbVNDGkyRn4/rzB
PlTevzLkxfrXQpVVPm6ZoNK1NJz0/zb8/5+jL/4TcL/j97+63cHD7399i6eI/sGKixu+4dydGD9H
fzQEdHv8p9vtb/7+R6/bfoj/fIsnH/9Z8aakfSEnbA0HddsYyhn0t4SDbgdbDHLQxd8WOWinfw/E
7IgfBDFT9rSKjDSUQZFco6MTyxF4i4NG6jzxFMzef1zap9hkxDCXHA3BKr4IVUFnjnMOekCcOeKR
I9ggxk9gSkVGDjxUq7NHGhy6oREHPRFg1W2wf4mjr8/uzb90YgPdO6B24AbR9+OjI5Gag5EQabvo
44SNs9aGMh8Avw6YOFxMJhqRJgGnZsS6Hbz5u4wmI2b25K+Q9fv7B+KHyAbtdsNsy5v26iYx3qcn
q/f0MjbEVKr4g2C4ZoPw9dILlvEPlsfxOr70kfllzD1nxCo/hP7lwr80Aqw30k3luYN76XowxQ+6
5SssMU7+CvY4XThP7maf+IsAcMmBQBaYW7oOcRX68zkPR4SjS8qjhMFxylYQGO9dvj7RjdJXpeSv
nvD4/SuhMVPEXy1kHhMBRSKSvYqGNbkr3FAtoFS9HuosOqh3I3FxK2GFhGVyTFdFrpA3hp4m6SqP
cQlu9ELeRlGjfMCWH2vpXAVOv8jgoqWJlYepCsdfe9XK1OVzhzoeEfO5zsdKzcCl41WEqlvTXeQp
GyE5OTxOp4rhZDQLqmyzLE597+8SdJTGKRVswajcJ2IRKfSxZ+oeEqszAcGQS2CjZOUIwvnv9q6t
qW1kCT97f4VgUyW74gu2sSGmqK2EJLvU2SRUSDYPrJcYSyxObItjyTgs8X/fvsxdsjGXJJw6mgcs
Rj3Xnun+pqdnFOIAcYhk3uigR6aO6gEaN9DqNxgnB+Ks1SEfteKksHLAtaFfkmmh9dL9DXviiItE
7whIsKNd7eBnx+2KAR7ihyEOVHIcfMFVfIfO9OOgh2qEIPqIRXQAEGmQVUAiGqGiYbVP3drhe2co
qvdFRLVl1NkggNV/x0sm01DGEXR9NuyNP+sZRC+CQUyLRJu8j0vijjxDIin8qzXJl7mqE7a1QH/c
BiYgCTKbRStwFUkkv/dOwmEHN2sxVdE/jKZ4IPmAGCEph0j0YRAkZyDDGqoLwmCQYA1XbHE4Ok8u
30EpUBOyGXy5/EdVhk7K9GAxbA5cY67RxLyo0r5t/AHW5EXOQ60v5WCQLVmnw6YjwBUeJeKFPKVZ
19NubuWPfh24Tqod/TmrVfC8fTUJ4wQqsqgQeQifNrh548PNXabBPtq5G+8ay3n3rjeB55x3P4p3
AN1PIpdvbM1azjghct9BNjdgnMWghZyLgS8h6nraawEZi3eJdA3WoQgTL0UkCOW/QTI+7fNhNb83
HPoZA0HLDFAA/UQezU5UK+SZbSyNbKBZcIZPJjt4xlsVz3gr4RnGXO0nbcZcAJDNeyUk2vKW4K0X
0OtLkNYMCopmVaaSKkgCh47W31o9xU8DLfoxZsac3mxtaKLxIEH8FY1DhM9qbmWrcoZHSn/vemum
lhYJBtSH8BJbygy7BlmyWqJsDL0vh4MsrmNiB/kS1hcwNF5HAb/W/9LgKOlaxdOTTyEdI1qM4gQN
VF2NO6qvry1P4QrEgGZ8r+jDj0ZvEFXyBaCCvwLBDi+LeK7dybIjH1QPCKDBPds1m4YlwNwB4AP8
K+rIYdQLijpfMvgZ7OXLwmAGy7uJpCs1j38DOCvSKjxMhzB2+dJUAWRT/WggTYkx8QdZIC64NYEa
/jhALau8I9WRXRPByYwZ20kXWxoWiEI6VGLV9bM1orWnbV8MMXrVV0OsIHYozI6hwiTitSW22ou8
Xhqp2Z4th+zZzqe/m+2NOhntm+36Vqtcb0h/AbljPF+2ptvHmT4K7rSqU/D2IoQFTkaOaWjsiXCl
HxfqKNuoX7ZTZKIXk0AoQ2GHd9+ayssQiTII0dja2DBemMplxdWPTMp4hJcrcn/h61fPjqnCiB+B
qN3d3fV8X2IIQSOWPLu6RTSfnKWQeLdjVFo/Gss7Jk8tYeLVWoPi35QzR0zTLaUyXKpPZHauWpHx
aWFmTqbMUf1U7kXf47jOzFMdmsIXb1hoIhywb2+TN7d1V58JzpLxP3/sIcR7Fn1ZML65wBVmExG6
s4hHzwtEWJnzgPDlfqrOMhz5r6MxQTz6BWmcRTOJkAL+dstZr2nbHCn4IZtoMqM8Zn7XfutSS3TJ
9UrPXQx37HFi7QodjnR5f3t37m8xh1bpckH6f9/rt9BQF72JxxBLnoVx5L0p6aRZs6hyZNxYcnmN
eo8LO2KKLlq9nRi0f3NTUukxCOCH/oqiGITPu76yEsqMSjt24nnWKHDSGH0nISTWWZQ5DMd/J2eO
JjYdqgSdPNXCQNh0E0irb5Xc14BYN/UetDNy0l6lyTegUO/IRaPxio86DuBHfzgNAA6bfCplctUZ
A7vpzNQ9OqUqKPlA1xJ1aGaeRhcijWn+sSq0k046L8ny4P1Rvbt4KM1L6bnxo7FQ5sLipdj0v5Oh
w4ZCWVnKtUiryWuRZnNT3fCOK5CCdHBw5D65OZyw1F9sp0LwBSskbaMSSkHeNSujFxixTbdDtmMX
oEhRiH+lX74ZDy9XMXSnK++Z1RqfxirKbI//+uWheiHryh1Xb9a54/CG/OaGvsRruY1IrLZuZiVK
c9TKRgkaaXhYvhRDHvwe9TKNSu0Nw6gkNCtt2l2/ZKTGSwPecpR/19Y7GS1vv+nAu0IPNFur9MCC
xYXVB0tn980MB4untKCgMbnVbLLdcqsNjWjyx3MKcmZ4qOEsC6OnJw31ijxEwPPxLOwFuGer57Rz
zTpPbnmxqNjisi8dLxTQCI1Z9nvncfViFJvuT0Kf+V3vF23zcWbsB+oIyedCIZvPC6pm8JC1+lIM
C++llBLZidgsHCohAlAfH8u7VY9FAgeYFrgmRzalJ3nNO87iDRrMQd2te0XVkaX1btnIxLz+fV39
Y9MYt8KXrTMegkr8ZIvuxX05Z2OaPYoe26NImDIWDaKURHIHkN0r6PyLXWKNpWxh6lZEIZJlVXGE
w10qkxJKeuLhg77znT0+0vU5UBRYF8+ti9ir4Zm+ie40dZzq6PrbaNBUR99SF294bEimvZ1qLwhe
DoZJOCnizVgonqbQsKqIo146peeXYwPoKNxWYDut/PqHp/KFJjy73A+KPr8SeJoQuSAG1MlPZAiu
ivvLcQER9QfKZibNXGtH2v5nIu+uRqoEFCkvcctkQThCuBtxFDsvsWc4dgW0yO9Byy5osw0bMeFW
EOx8fx6gEXxH00JpySS6dEij8yzKBfmaxEw+AvoRddwh0hRLuN0Gremf9cb0oT93D0eASc6RmUTs
ZYEYJscn0ySJxnhcOZnG/Mq0KPOwaW+ygtje2KiXt9rasRhdd2fe+jjy/njl7T/XXzuiM0dz6aiF
axQ2qz8NglfheCqcpoyKiu6XA2wERFWkVNsYQ7yBHaSWFMonIR5siM+imTHmMJmxE2HPw6cH+423
4X/xa0E8aAvTCUiwj7Xe+aBRg7n0Ka6R837t0RX+ktM7fS3l0RX64s7FV1M+shQchclZhMr31xfv
hABfvNUih6oE/WoyZG14VPntjpWCZYQ46kDdQyqKF0v4iC5GNLxRLJBVWYmIV7SEExtUJTtfdsQ+
MPywb5y9uPvZyMMqhXaKdO1hTqfKVDNZ0+Fuy2/k7yKFgZ73nHchlU06za6ThoY1z3qtnkpqwtsq
ydDEakgl9s409+xBNAAxY4AHGCh7Q3RWO+2BAK6czvDvWRBUIu9k2Ot/1qBEL1/WsrDO80H8mTfT
2QGoNw7II86ZPYVC1nYrVY7qppGz6AMUjoc0dzQwwfj0jHh0hbcmQvz8o0FmLLRo6xU65A2hK/Y7
800C0THX79gWMic68plEaccrkh8disiQtjiNjJmdhbnhX8Goo3w9+8TEyGAf+rMOcCBVMK5yTl9I
TXFOiZk4nLzG8y80UtGRGI8R+LfknuMWcD+Me2D9nyU5HhgbnA3b/2k+4L/agYBeMr4hBQ3iR/ht
IBoIq6/YdRvndtH/dTrY653zV12RGrr98x4dRlostuTF5YA2Wy0GEHX9mZ6CKF8Ajp/YU4McIxkk
o7eAy9Jdi6WwAMyYLuY6g428ix10NVotCx8U4xBRNIsNl1BiAu04dLxt6tNoQkh8QP8kwfKxKoG/
0cBy5voi5UdiOpGo9cGO5KLghxhjaHJmDIMpJYrBtARkyIo+4swEmvEVuIzD4StI4Drv0IAgByz8
0NjbaEZEOBnm8su7W0+a7Jqw3Ww/Efc5KIAxiN+P8cNxOCYga8Dd1REeRCnW/prSiz+DxzWFSUUK
TT+I6QEPEZs52fRCjti584G0Gs8EppP4ySST58dqAmbLXMcRcolrwOb8r1+9NRgUMLSqzEBZCdrv
F/RQ0WsEEZKYFRid8+k1eUsBdOfmFn3KeLu53TK7EzgS46eSjhGgsc07TJ4LAVgcxG+hiJeHqi8B
Ug7+CRcR676khldEklF0ER6fJGOLeq0o2ABdIHu7xP9wmdQ3UibA83k4DsR3j26aLz+/4HPIKxUh
W3sRTpJ0EQadojQrg0vzojHkfjHf94RppWNGGjYXPQO2m+VNXFlvo2HX4Fly0psgiPQKZBrP0oKw
KEK1V5G+/eNpJ3MhVMHFsQSlFSHwObqwHJcSySqolAhXxKREm61M6RXWbkVYSvQFV6dy7DUaVRDd
FJBysiVqmAksJcxRBDqWaGKmmpd1J6CcrBiRQisv52A2NHIYmalsHB5eC4tuy0cHGd2Zhz+cGV01
B+cahfJ0tKwXRbazsXEchT5KBfpHC4nyA7tALXX+E+HAPZdxi/O/rfpGfv73e4RM/kf9gfXl3296
/hfGRnvTPf9L57/z87/fPjjnf41vQLuDYPFNcC08+vuknn30d3GOCw4SU27NbePUb73cxO+DsGPz
z977MWYC8Jzu6TiN0IeXLgc99S6jqTfrjemOILyv6vlvewd0ecObvX19tUr8U+Vn9R1bMtNX8CYG
vPLKrjfd3lkLzvrDARRnp4rOr6V/fJtCHt+iDLGNkSYWHW/N5ZqlgfT83642ql/u/e4HDDeR/61N
nP+NRr2Zy//vEVz+08WN91wG8X9r6wb8b7VBDXiNatW6lfSeq8Uh57/F/0/x/Zdxc/5vtut1i//f
oloccv5b/Aetce9l3GL+wwrA4v+3qBaHnP+K/82HpP83c/3/PYLL/4ei/zc3cv3/PYLL/wej/xu5
/v8eweX/g9H/7Vz/5yEPechDHvKQhzzkIQ95yEMe8pCHPOQhD3nIQx7ykIc85CEPechDHvKwavgX
QkvCvgDIAAA='

########### Function ###########
show_usage() {
    echo -e "${BLUE}==========================================================${NC}"
    echo -e "${BLUE}                 PVE OCI Support Patch Tool${NC}"
    echo -e "${BLUE}==========================================================${NC}"
    echo -e "用法 (Usage): $0 [选项 (Options)]"
    echo ""
    echo -e "选项 (Options):"
    echo -e "  -h, --help       显示此帮助信息 (Show this help message)"
    echo -e "  -R, --restore    恢复原始文件 (Restore original files)"
    echo -e "  -y, --yes        跳过确认提示 (Skip confirmation prompts)"
    echo -e "  -c, --chinese    使用中文显示消息（默认）"
    echo -e "  -e, --english    Use English for messages"
    echo ""
    echo -e "${BLUE}==========================================================${NC}"
}


printf_msg() {
    local text_zh="$1"
    local text_en="$2"
    local type="${3:-INFO}"
    
    local color=$BLUE
    case "$type" in
        SUCCESS) color=$GREEN ;;
        WARNING) color=$YELLOW ;;
        ERROR) color=$RED ;;
        *) color=$BLUE ;;
    esac
    
    if [[ "$LANGUAGE" == "zh_cn" ]]; then
        echo -e "${color}${text_zh}${NC}"
    else
        echo -e "${color}${text_en}${NC}"
    fi
}

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)
                show_usage
                exit 0
                ;;
            -R|--restore)
                RESTORE_MODE=1
                shift
                ;;
            -y|--yes)
                SKIP_CONFIRM=1
                shift
                ;;
            -c|--chinese)
                LANGUAGE="zh_cn"
                shift
                ;;
            -e|--english)
                LANGUAGE="en_us"
                shift
                ;;
            *)
                printf_msg "错误: 未知选项 $1" "Error: Unknown option $1" "ERROR"
                show_usage
                exit 1
                ;;
        esac
    done
}


generate_path() {
    CREATE_NEW_FILE=0
    
    FIRST_LINE_PATH=$(awk 'NR==1 {print $2}' "$1")
    SECOND_LINE_PATH=$(awk 'NR==2 {print $2}' "$1")
    
    if [[ "$FIRST_LINE_PATH" == "/dev/null" ]]; then
        CREATE_NEW_FILE=1
    fi
    TARGET_FILE="${SECOND_LINE_PATH}"
    
    if [[ ! "${SECOND_LINE_PATH}" =~ ^/ ]]; then
        TARGET_FILE=""
    fi
}


check_ready() {
    generate_path "$1"

    if [[ -z "$TARGET_FILE" ]]; then
        printf_msg "无法从补丁中获取目标文件路径: $1" "Cannot get target file path from patch: $1" "ERROR"
        return 1
    fi

    BACKUP_FILE="$TARGET_FILE.bak"
    
    if [ -e "$BACKUP_FILE" ]; then
        printf_msg "备份文件已存在: $BACKUP_FILE" "Backup file already exists: $BACKUP_FILE" "WARNING"
    elif [ -e "$TARGET_FILE" ]; then
        NEED_BACKUP_FILES+=("$TARGET_FILE")
    else
        if [[ "$CREATE_NEW_FILE" -eq 0 ]]; then
            printf_msg "未找到目标文件: $TARGET_FILE" "Target file not found: $TARGET_FILE" "ERROR"
            return 1
        fi
    fi

    TARGET_DIR=$(dirname "$TARGET_FILE")
    
    if [[ ! -d "$TARGET_DIR" && "$CREATE_NEW_FILE" -eq 1 ]]; then
        printf_msg "目标目录不存在，将创建: $TARGET_DIR" "Target directory does not exist, will create: $TARGET_DIR" "INFO"
        mkdir -p "$TARGET_DIR"
    fi

    PATCH_FILE="$1"
    if ! patch --dry-run -d "$TARGET_DIR" < "$PATCH_FILE" >/dev/null 2>&1; then
        printf_msg "补丁 $PATCH_FILE 无法应用。请检查补丁文件和目标目录。" "$PATCH_FILE Patch cannot be apply. Please check the patch file and target directory." "ERROR"
        patch --dry-run -d "$TARGET_DIR" < "$PATCH_FILE"
        return 1
    else
        if [[ "$CREATE_NEW_FILE" -eq 1 ]]; then
            printf_msg "将创建新文件: $TARGET_FILE" "Will create new file: $TARGET_FILE" "SUCCESS"
        else
            printf_msg "补丁 $PATCH_FILE 可以成功应用" "$PATCH_FILE Patch can be apply successfully." "SUCCESS"
        fi
        CHECK_PATCH_PASS+=("$1")
        return 0
    fi
}


restore_patch(){
	generate_path "$1"
	
	if [[ -z "$TARGET_FILE" ]]; then
		printf_msg "无法从补丁获取目标文件路径: $1" "Cannot get target file path from patch: $1" "ERROR"
		return 1
	fi
	
	BACKUP_FILE="$TARGET_FILE.bak"
    
    if [[ "$CREATE_NEW_FILE" -eq 1 ]]; then
        if [ -e "$TARGET_FILE" ]; then
            rm -f "$TARGET_FILE"
            printf_msg "已删除新创建的文件 $TARGET_FILE" "Deleted newly created file $TARGET_FILE" "INFO"
        else
            printf_msg "文件不存在，无需删除: $TARGET_FILE" "File does not exist, no need to delete: $TARGET_FILE" "INFO"
        fi
    else
        TARGET_DIR=$(dirname "$TARGET_FILE")
        PATCH_FILE="$1"
        
        printf_msg "尝试反向应用补丁: $PATCH_FILE" "Trying to reverse apply patch: $PATCH_FILE" "INFO"
        
        if [ -e "$TARGET_FILE" ] && patch -R --dry-run -d "$TARGET_DIR" < "$PATCH_FILE" >/dev/null 2>&1; then
            patch -R -d "$TARGET_DIR" < "$PATCH_FILE" > /dev/null 2>&1
            printf_msg "成功反向应用补丁，恢复文件 $TARGET_FILE" "Successfully reverse applied patch to restore $TARGET_FILE" "SUCCESS"
        elif [ -e "$BACKUP_FILE" ]; then
            printf_msg "反向应用补丁失败，使用备份文件恢复" "Reverse patch failed, using backup file to restore" "WARNING"
            mv $BACKUP_FILE $TARGET_FILE
            printf_msg "成功恢复文件 $TARGET_FILE" "Restore $TARGET_FILE file successfully." "SUCCESS"
        else
            printf_msg "未找到备份文件 $BACKUP_FILE 且无法反向应用补丁" "Backup file $BACKUP_FILE not found and cannot reverse apply patch." "WARNING"
        fi
    fi
}


arrays_equal() {
    local arr1=("${!1}")
    local arr2=("${!2}")

    if [ ${#arr1[@]} -ne ${#arr2[@]} ]; then
        printf_msg "补丁检查失败！" "Patch check Failed!" "ERROR"
        return 1
    fi

    local sorted1=$(printf '%s\n' "${arr1[@]}" | sort)
    local sorted2=$(printf '%s\n' "${arr2[@]}" | sort)
    
    if [ "$sorted1" = "$sorted2" ]; then
        printf_msg "补丁检查通过！可以应用到当前PVE版本" "Patch check passed! Can work with this version of PVE" "SUCCESS"
        return 0
    fi
}


load_module() {
    local module=$1
    local params=$2
    local modules_file="/etc/modules"
    local modprobe_conf_file="/etc/modprobe.d/$module.conf"

    if ! lsmod | grep -q "$module"; then
    printf_msg "$module 模块未加载，正在加载..." "$module is not loaded, loading module..." "INFO"
    if [[ -n "$params" ]]; then
        modprobe "$module" $params
    else
        modprobe "$module"
    fi
    else
    printf_msg "$module 模块已加载" "$module is already loaded." "INFO"
    fi

    if ! grep -q "$module" "$modules_file"; then
    printf_msg "添加 $module 到 $modules_file" "Adding $module to $modules_file" "INFO"
    sed -i -e '$a\' "$modules_file"
    echo "$module" >> "$modules_file"
    fi
    if [[ -n "$params" && ! -f "$modprobe_conf_file" ]]; then
    echo "options $module $params" > "$modprobe_conf_file"
    fi
}

check_running_vms() {
    local running_vms=0
    local running_cts=0

    if command -v qm &> /dev/null; then
        running_vms=$(qm list | grep running | wc -l)
    fi

    if command -v pct &> /dev/null; then
        running_cts=$(pct list | grep running | wc -l)
    fi

    total=$((running_vms + running_cts))
    echo "$total"
}

cleanup() {
    rm -rf /tmp/patch_files.tar.gz /tmp/pct-patch
    if [ "$Need_RestartAPI" -eq 1 ]; then
        printf_msg "正在重启PVE Web界面服务..." "Restarting PVE Web UI services..." "INFO"
        systemctl restart pveproxy.service && systemctl restart pvedaemon.service
    fi
}
trap cleanup EXIT

read_user_input() {
    local prompt_zh="$1"
    local prompt_en="$2"
    local result
    
    if [[ "$LANGUAGE" == "zh_cn" ]]; then
        read -p "$prompt_zh" result
    else
        read -p "$prompt_en" result
    fi
    
    echo "$result"
}

########### Main ###########

PATCH_FILE_LIST=()
CHECK_PATCH_PASS=()
NEED_BACKUP_FILES=()
Need_RestartAPI=0

parse_arguments "$@"

PVE_VERSION=$(pveversion | awk -F'/' '{print $2}' | awk -F'-' '{print $1}')

if [[ "$(echo -e "$MIN_VERSION\n$PVE_VERSION" | sort -V | head -n1)" != "$MIN_VERSION" ]]; then
    printf_msg "当前PVE版本 $PVE_VERSION 低于 $MIN_VERSION。请升级PVE系统版本。" "The current PVE version $PVE_VERSION is lower than $MIN_VERSION. Please upgrade the PVE system version." "WARNING"
    exit 1
fi

if [[ "$SKIP_CONFIRM" -ne 1 ]]; then
    printf_msg "我已了解该脚本的作用，并自愿承担对应的风险。" "I have understood the purpose of this script and voluntarily assume the corresponding risks." "INFO"
    user_input=$(read_user_input "请输入 y/Y 继续执行: " "Please enter y/Y to continue: ")
    case "$user_input" in
        y|Y) Need_RestartAPI=1;;
        *)
            printf_msg "输入无效或用户取消操作，脚本退出。" "Invalid input or operation canceled, exiting the script." "ERROR"
            exit 1
            ;;
    esac
else
    Need_RestartAPI=1
fi

echo "$PATCH_BASE64" | base64 -d > /tmp/patch_files.tar.gz
tar -xzf /tmp/patch_files.tar.gz -C /tmp
FIX_VERSION=$(echo $PVE_VERSION |  awk -F'.' '{print $1"."$2".x"}' )
PATCH_TMP_DIR=$(find -L /tmp/pct-patch/${FIX_VERSION} -name "*.diff")

if [[ -z "$PATCH_TMP_DIR" ]]; then
    printf_msg "未找到适用于PVE版本 ${FIX_VERSION} 的补丁文件。" "No patch files found for PVE version ${FIX_VERSION}." "WARNING"
    Need_RestartAPI=0
    exit 1
fi

if [[ "$RESTORE_MODE" -eq 1 ]]; then
    if [ ! -f /usr/share/perl5/PVE/LXC/Setup/Oci.pm ]; then
        printf_msg "未检测到补丁应用的痕迹，无需恢复。" "No patch application detected, no need to restore." "WARNING"
        Need_RestartAPI=0
        exit 0
    fi

    for FILE in $PATCH_TMP_DIR; do
        restore_patch "$FILE"
    done
    
    modules=("binder_linux" "mac80211_hwsim")
    for module in "${modules[@]}"; do
        if grep -q "$module" /etc/modules; then
        printf_msg "从 /etc/modules 中移除 $module" "Removing $module from /etc/modules" "INFO"
        sed -i "/^$module$/d" /etc/modules
        fi
    done
    rm /etc/modprobe.d/binder_linux.conf
    
    printf_msg "恢复完成，已还原到原始状态" "Restoration completed, system has been reverted to original state" "SUCCESS"
    exit 0
fi

if ! command -v patch &> /dev/null; then
    printf_msg "未找到 'patch' 命令，正在安装..." "The 'patch' command is not found. Installing it now..." "INFO"
    apt update
    apt install -y patch
    clear 
    printf_msg "'patch' 命令安装成功" "The 'patch' command was installed successfully." "SUCCESS"
fi

if [ -f /usr/share/perl5/PVE/LXC/Setup/Oci.pm ]; then
    printf_msg "该补丁已执行，请不要再次执行。如需恢复，请使用 -R 或 --restore 参数。" "The patch has already been applied. Please do not apply it again. If you need to revert, use the -R or --restore option." "WARNING"
    Need_RestartAPI=0
    exit 1
fi

for FILE in $PATCH_TMP_DIR; do
    check_ready "$FILE"
    PATCH_FILE_LIST+=("$FILE")
done

if ! arrays_equal PATCH_FILE_LIST[@] CHECK_PATCH_PASS[@]; then
    printf_msg "由于补丁检查不通过，脚本停止执行" "Script stop execution due to patch check failure" "ERROR"
    Need_RestartAPI=0
    exit 1
fi

for FILE in "${NEED_BACKUP_FILES[@]}"; do
    BACKUP_FILE="$FILE.bak"
    printf_msg "备份 $FILE 到 $BACKUP_FILE" "Backing up $FILE to $BACKUP_FILE" "INFO"
    cp "$FILE" "$BACKUP_FILE"
done

for FILE in "${CHECK_PATCH_PASS[@]}"; do
    printf_msg "应用补丁: $FILE" "Applying patch: $FILE" "INFO"
    generate_path $FILE
    TARGET_DIR=$(dirname "$TARGET_FILE")
    PATCH_FILE="$FILE"
    patch -d "$TARGET_DIR" < "$PATCH_FILE" > /dev/null 2>&1
done

load_module "binder_linux" "devices=binder,hwbinder,vndbinder"
load_module "mac80211_hwsim"

printf_msg "所有操作已完成！" "All operations completed successfully!" "SUCCESS"
printf_msg "作者: lurenjbd" "Author: lurenjbd" "INFO"

RUNNING_VMS=$(check_running_vms)
if [ -n "$RUNNING_VMS" ] && [ "$RUNNING_VMS" -gt 0 ]; then
    printf_msg "检测到当前有 $RUNNING_VMS 个运行中的虚拟机或容器，建议重启PVE宿主机以确保补丁完全生效。" \
               "Detected $RUNNING_VMS running VMs or containers, it is recommended to restart the PVE host to ensure the patch takes full effect." "WARNING"
fi
