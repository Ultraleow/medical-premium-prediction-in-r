## R Markdown

\#Import the mathdata

    library(tidyverse)

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
    ## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
    ## ✔ readr   2.1.2     ✔ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

    library(psych)

    ## 
    ## Attaching package: 'psych'

    ## The following objects are masked from 'package:ggplot2':
    ## 
    ##     %+%, alpha

    mathdata<-read.csv("/Users/zhangjiping/Desktop/Medicalpremium.csv")
    head(mathdata)

    ##   Age Diabetes BloodPressureProblems AnyTransplants AnyChronicDiseases Height
    ## 1  45        0                     0              0                  0    155
    ## 2  60        1                     0              0                  0    180
    ## 3  36        1                     1              0                  0    158
    ## 4  52        1                     1              0                  1    183
    ## 5  38        0                     0              0                  1    166
    ## 6  30        0                     0              0                  0    160
    ##   Weight KnownAllergies HistoryOfCancerInFamily NumberOfMajorSurgeries
    ## 1     57              0                       0                      0
    ## 2     73              0                       0                      0
    ## 3     59              0                       0                      1
    ## 4     93              0                       0                      2
    ## 5     88              0                       0                      1
    ## 6     69              1                       0                      1
    ##   PremiumPrice
    ## 1        25000
    ## 2        29000
    ## 3        23000
    ## 4        28000
    ## 5        23000
    ## 6        23000

    str(mathdata)

    ## 'data.frame':    1013 obs. of  11 variables:
    ##  $ Age                    : int  45 60 36 52 38 30 33 23 48 38 ...
    ##  $ Diabetes               : int  0 1 1 1 0 0 0 0 1 0 ...
    ##  $ BloodPressureProblems  : int  0 0 1 1 0 0 86 0 0 0 ...
    ##  $ AnyTransplants         : int  0 0 0 0 0 0 0 5 0 0 ...
    ##  $ AnyChronicDiseases     : int  0 0 0 1 1 0 0 0 0 0 ...
    ##  $ Height                 : int  155 180 158 183 166 160 150 181 169 182 ...
    ##  $ Weight                 : int  57 73 59 93 88 69 54 79 74 93 ...
    ##  $ KnownAllergies         : int  0 0 0 0 0 1 0 1 1 0 ...
    ##  $ HistoryOfCancerInFamily: int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ NumberOfMajorSurgeries : int  0 0 1 2 1 1 0 0 0 0 ...
    ##  $ PremiumPrice           : int  25000 29000 23000 28000 23000 23000 21000 15000 23000 23000 ...

    summary(mathdata)

    ##       Age           Diabetes      BloodPressureProblems AnyTransplants   
    ##  Min.   :18.00   Min.   :0.0000   Min.   :  0.000       Min.   :0.00000  
    ##  1st Qu.:30.00   1st Qu.:0.0000   1st Qu.:  0.000       1st Qu.:0.00000  
    ##  Median :42.00   Median :0.0000   Median :  0.000       Median :0.00000  
    ##  Mean   :41.71   Mean   :0.4184   Mean   :  0.696       Mean   :0.07206  
    ##  3rd Qu.:53.00   3rd Qu.:1.0000   3rd Qu.:  1.000       3rd Qu.:0.00000  
    ##  Max.   :66.00   Max.   :1.0000   Max.   :132.000       Max.   :6.00000  
    ##  NA's   :5       NA's   :2                                               
    ##  AnyChronicDiseases     Height        Weight       KnownAllergies  
    ##  Min.   :0.0000     Min.   :145   Min.   : 51.00   Min.   :0.0000  
    ##  1st Qu.:0.0000     1st Qu.:161   1st Qu.: 67.00   1st Qu.:0.0000  
    ##  Median :0.0000     Median :168   Median : 75.00   Median :0.0000  
    ##  Mean   :0.1836     Mean   :168   Mean   : 76.77   Mean   :0.2152  
    ##  3rd Qu.:0.0000     3rd Qu.:176   3rd Qu.: 86.50   3rd Qu.:0.0000  
    ##  Max.   :6.0000     Max.   :188   Max.   :132.00   Max.   :1.0000  
    ##                     NA's   :5     NA's   :6                        
    ##  HistoryOfCancerInFamily NumberOfMajorSurgeries  PremiumPrice  
    ##  Min.   :0.0000          Min.   :0.000          Min.   :15000  
    ##  1st Qu.:0.0000          1st Qu.:0.000          1st Qu.:21000  
    ##  Median :0.0000          Median :1.000          Median :23000  
    ##  Mean   :0.1147          Mean   :0.665          Mean   :24316  
    ##  3rd Qu.:0.0000          3rd Qu.:1.000          3rd Qu.:28000  
    ##  Max.   :1.0000          Max.   :3.000          Max.   :40000  
    ##  NA's   :2               NA's   :1

    describe(mathdata)

    ##                         vars    n     mean      sd median  trimmed     mad
    ## Age                        1 1008    41.71   14.00     42    41.64   17.79
    ## Diabetes                   2 1011     0.42    0.49      0     0.40    0.00
    ## BloodPressureProblems      3 1013     0.70    4.95      0     0.47    0.00
    ## AnyTransplants             4 1013     0.07    0.37      0     0.00    0.00
    ## AnyChronicDiseases         5 1013     0.18    0.42      0     0.10    0.00
    ## Height                     6 1008   168.02   10.11    168   168.27   11.86
    ## Weight                     7 1007    76.77   14.14     75    76.02   13.34
    ## KnownAllergies             8 1013     0.22    0.41      0     0.14    0.00
    ## HistoryOfCancerInFamily    9 1011     0.11    0.32      0     0.02    0.00
    ## NumberOfMajorSurgeries    10 1012     0.67    0.75      1     0.56    1.48
    ## PremiumPrice              11 1013 24315.89 6286.70  23000 24029.59 7413.00
    ##                           min   max range  skew kurtosis     se
    ## Age                        18    66    48  0.03    -1.13   0.44
    ## Diabetes                    0     1     1  0.33    -1.89   0.02
    ## BloodPressureProblems       0   132   132 23.41   570.78   0.16
    ## AnyTransplants              0     6     6  9.69   127.91   0.01
    ## AnyChronicDiseases          0     6     6  3.75    34.46   0.01
    ## Height                    145   188    43 -0.16    -0.78   0.32
    ## Weight                     51   132    81  0.70     0.68   0.45
    ## KnownAllergies              0     1     1  1.38    -0.08   0.01
    ## HistoryOfCancerInFamily     0     1     1  2.41     3.83   0.01
    ## NumberOfMajorSurgeries      0     3     3  0.87     0.10   0.02
    ## PremiumPrice            15000 40000 25000  0.12    -0.46 197.52

\#Check inconsistent data(character)

    ##  [1] 45 60 36 52 38 30 33 23 48 66 24 46 18 42 57 21 49 20 35 53 31 22 26 28 64
    ## [26] 50 44 58 43 25 54 63 61 41 55 19 40 32 27 34 59 29 47 39 37 51 56 62 65 NA

    ## [1]  0  1 NA

    ## [1]   0   1  86   3   4 132

    ## [1] 0 5 1 6

    ## [1] 0 1 6

    ##  [1] 155 180 158 183 166 160 150 181 169 182 175 186 178 184 149 154 156 163 151
    ## [20] 172 162 153 168 152 161 157 147 173 179 165 174 185 177 164 148 170 187 167
    ## [39] 159 188 171 176  NA 146 145

    ##  [1]  57  73  59  93  88  69  54  79  74  67  97  76  68  82  61  81  92  83  58
    ## [20]  96  91  85  55  78  56  77  63  75  72  70  80  60  53  94  84  87  64  95
    ## [39]  66  62  86  90  65 116 118 110 121  98 104  89  71 106  99 119 107 129 109
    ## [58] 100 127 132 120 128 114 123 111 103 126 102 105 124 122  52  51  NA 101

    ## [1] 0 1

    ## [1]  0  1 NA

    ## [1]  0  1  2  3 NA

    ##  [1] 25000 29000 23000 28000 21000 15000 35000 30000 32000 19000 24000 38000
    ## [13] 31000 26000 39000 22000 40000 18000 34000 20000 16000 36000 27000 17000

\#Change data type

    mathdata$Age<-as.numeric(mathdata$Age)
    mathdata$Diabetes <- as.numeric(mathdata$Diabetes)
    mathdata$AnyTransplants <- as.numeric(mathdata$AnyTransplants)
    mathdata$AnyChronicDiseases <- as.numeric(mathdata$AnyChronicDiseases)
    mathdata$Height <- as.numeric(mathdata$Height)
    mathdata$Weight <- as.numeric(mathdata$Weight)
    mathdata$KnownAllergies <- as.numeric(mathdata$KnownAllergies)
    mathdata$HistoryOfCancerInFamily <- as.numeric(mathdata$HistoryOfCancerInFamily)
    mathdata$NumberOfMajorSurgeries <- as.numeric(mathdata$NumberOfMajorSurgeries)
    mathdata$PremiumPrice <- as.numeric(mathdata$PremiumPrice)
    mathdata$BloodPressureProblems <- as.numeric(mathdata$BloodPressureProblems)

\#boxplot outlier

    boxplot(mathdata)

![](Data-preprocessing_files/figure-markdown_strict/unnamed-chunk-2-1.png)

\#Check for missing data

    anyNA(mathdata)

    ## [1] TRUE

    sum(is.na(mathdata))

    ## [1] 21

    ##List number of missing data in column
    colSums(is.na(mathdata))

    ##                     Age                Diabetes   BloodPressureProblems 
    ##                       5                       2                       0 
    ##          AnyTransplants      AnyChronicDiseases                  Height 
    ##                       0                       0                       5 
    ##                  Weight          KnownAllergies HistoryOfCancerInFamily 
    ##                       6                       0                       2 
    ##  NumberOfMajorSurgeries            PremiumPrice 
    ##                       1                       0

    # List rows with missing data
    missingdata <- mathdata[!complete.cases(mathdata), ]
    sum(is.na(missingdata))

    ## [1] 21

\#Ientify duplicate row

    duplicated(mathdata)

    ##    [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##   [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##   [25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##   [37] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##   [49] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##   [61] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##   [73] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##   [85] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##   [97] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [109] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [121] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [133] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [145] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [157] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [169] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [181] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [193] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [205] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [217] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [229] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [241] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [253] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [265] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [277] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [289] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [301] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [313] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [325] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [337] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [349] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [361] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [373] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [385] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [397] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [409] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [421] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [433] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [445] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [457] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [469] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [481] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [493] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [505] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [517] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [529] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [541] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [553] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [565] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [577] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [589] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [601] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [613] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [625] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [637] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [649] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [661] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [673] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [685] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [697] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [709] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [721] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [733] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [745] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [757] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [769] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [781] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [793] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [805] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [817] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [829] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [841] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [853] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [865] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [877] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [889] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [901] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [913] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [925] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [937] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [949] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [961] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [973] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [985] FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [997]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1009]  TRUE  TRUE FALSE  TRUE  TRUE

    sum(duplicated(mathdata))

    ## [1] 24

\#delete duplicate rows

    mathdata<-mathdata %>% distinct()
    sum(duplicated(mathdata))

    ## [1] 0

\#remove invalid values

    mathdata<-mathdata[complete.cases(mathdata[,7:11]),]
    mathdata<-mathdata[complete.cases(mathdata[,2:5]),]
    missingdata <- mathdata[!complete.cases(mathdata), ]

    sum(is.na(missingdata))

    ## [1] 10

\#delete outlier

    data=filter(mathdata,mathdata$BloodPressureProblems<'2'&mathdata$AnyTransplants<'2'&mathdata$AnyChronicDiseases<'2'&mathdata$BloodPressureProblems<'2'&mathdata$Height<'250')
    mathdata<-data

\#Median imputation for numerical data & Mode imputation for categorical
data

    mathdata.impute <- mathdata
    for (i in which(sapply(mathdata.impute, is.numeric))){
      mathdata.impute[is.na(mathdata.impute[, i]), i] <- median(mathdata.impute[ , i], na.rm = TRUE)
    }

\#Convert INR to MYR

    mathdata.impute$PremiumPrice<-mathdata.impute$PremiumPrice*0.0563
    print(mathdata.impute)

    ##     Age Diabetes BloodPressureProblems AnyTransplants AnyChronicDiseases Height
    ## 1    45        0                     0              0                  0    155
    ## 2    60        1                     0              0                  0    180
    ## 3    36        1                     1              0                  0    158
    ## 4    52        1                     1              0                  1    183
    ## 5    38        0                     0              0                  1    166
    ## 6    30        0                     0              0                  0    160
    ## 7    48        1                     0              0                  0    169
    ## 8    38        0                     0              0                  0    182
    ## 9    60        0                     1              0                  0    175
    ## 10   66        1                     0              0                  0    186
    ## 11   24        0                     0              0                  0    178
    ## 12   46        0                     1              0                  0    184
    ## 13   18        0                     0              1                  0    150
    ## 14   38        0                     0              0                  0    160
    ## 15   42        0                     0              0                  1    149
    ## 16   38        1                     0              0                  0    154
    ## 17   21        0                     1              0                  0    186
    ## 18   49        1                     0              0                  0    160
    ## 19   20        1                     0              0                  0    181
    ## 20   35        0                     0              0                  0    163
    ## 21   35        0                     1              0                  0    175
    ## 22   53        0                     1              0                  0    151
    ## 23   31        0                     0              0                  0    172
    ## 24   22        0                     0              1                  0    151
    ## 25   60        0                     1              0                  0    151
    ## 26   30        0                     0              0                  1    162
    ## 27   33        1                     1              0                  1    153
    ## 28   22        0                     0              0                  0    168
    ## 29   28        0                     0              0                  0    158
    ## 30   26        0                     0              0                  0    154
    ## 31   64        1                     0              0                  0    172
    ## 32   50        0                     0              0                  0    161
    ## 33   44        1                     0              0                  0    157
    ## 34   58        0                     1              0                  1    147
    ## 35   43        0                     0              0                  1    173
    ## 36   24        1                     1              1                  0    168
    ## 37   20        0                     1              0                  0    163
    ## 38   66        1                     1              0                  0    179
    ## 39   25        0                     1              0                  0    184
    ## 40   52        0                     0              0                  0    181
    ## 41   26        1                     0              0                  0    165
    ## 42   44        0                     1              0                  0    178
    ## 43   25        1                     1              0                  0    179
    ## 44   54        1                     0              0                  1    174
    ## 45   64        0                     1              0                  0    156
    ## 46   20        0                     0              0                  0    160
    ## 47   30        0                     1              0                  0    162
    ## 48   63        0                     1              0                  0    161
    ## 49   43        0                     0              0                  0    172
    ## 50   58        1                     0              0                  1    165
    ## 51   41        1                     1              0                  0    160
    ## 52   60        0                     1              0                  0    177
    ## 53   49        1                     0              0                  0    164
    ## 54   23        0                     1              0                  0    156
    ## 55   46        1                     1              0                  0    181
    ## 56   36        0                     1              0                  0    154
    ## 57   55        1                     1              0                  0    148
    ## 58   23        0                     1              0                  0    169
    ## 59   31        0                     0              0                  1    163
    ## 60   64        0                     1              0                  0    170
    ## 61   26        1                     1              0                  0    183
    ## 62   49        1                     1              0                  0    154
    ## 63   19        0                     0              0                  0    148
    ## 64   40        0                     0              0                  0    180
    ## 65   32        0                     0              0                  0    177
    ## 66   27        0                     1              0                  0    147
    ## 67   55        0                     1              0                  1    157
    ## 68   63        1                     0              0                  0    150
    ## 69   25        1                     1              1                  1    179
    ## 70   53        1                     0              0                  0    154
    ## 71   66        1                     1              0                  0    161
    ## 72   23        0                     0              0                  0    162
    ## 73   36        1                     1              0                  0    149
    ## 74   49        1                     1              0                  0    158
    ## 75   30        0                     0              1                  1    166
    ## 76   44        0                     0              0                  0    185
    ## 77   63        1                     0              0                  0    181
    ## 78   27        1                     1              0                  0    149
    ## 79   46        1                     0              0                  0    187
    ## 80   46        1                     0              0                  0    152
    ## 81   31        0                     0              0                  1    150
    ## 82   46        0                     1              1                  0    152
    ## 83   20        1                     1              0                  0    167
    ## 84   35        1                     1              0                  0    157
    ## 85   33        0                     0              0                  1    167
    ## 86   46        0                     0              0                  0    178
    ## 87   63        1                     1              0                  0    175
    ## 88   52        0                     0              0                  0    159
    ## 89   54        1                     1              0                  1    185
    ## 90   53        1                     1              0                  0    159
    ## 91   21        0                     0              0                  0    165
    ## 92   34        0                     1              0                  0    162
    ## 93   31        0                     0              0                  1    186
    ## 94   52        1                     0              0                  0    161
    ## 95   42        0                     0              0                  0    148
    ## 96   24        0                     0              0                  0    170
    ## 97   45        1                     0              1                  0    152
    ## 98   21        0                     1              0                  0    185
    ## 99   23        0                     0              0                  0    160
    ## 100  33        1                     0              0                  0    168
    ## 101  60        0                     0              0                  0    155
    ## 102  31        0                     0              0                  0    188
    ## 103  28        0                     0              0                  1    164
    ## 104  64        1                     0              0                  0    187
    ## 105  55        0                     1              0                  0    159
    ## 106  35        1                     1              0                  0    186
    ## 107  29        0                     0              0                  0    154
    ## 108  35        0                     0              0                  0    165
    ## 109  47        1                     1              0                  0    147
    ## 110  25        0                     0              0                  1    167
    ## 111  55        1                     0              0                  0    182
    ## 112  59        0                     1              0                  0    163
    ## 113  66        1                     0              0                  0    169
    ## 114  32        0                     1              0                  0    178
    ## 115  54        0                     1              0                  1    164
    ## 116  63        0                     1              0                  0    157
    ## 117  38        0                     0              0                  0    156
    ## 118  23        0                     0              0                  0    152
    ## 119  33        0                     0              0                  0    149
    ## 120  31        1                     0              1                  0    187
    ## 121  43        0                     0              0                  1    174
    ## 122  39        0                     1              0                  0    151
    ## 123  59        1                     0              0                  0    154
    ## 124  19        1                     0              0                  0    185
    ## 125  28        0                     1              0                  0    171
    ## 126  59        1                     1              0                  1    167
    ## 127  38        1                     1              0                  0    163
    ## 128  23        1                     0              0                  0    150
    ## 129  34        0                     0              0                  0    152
    ## 130  27        1                     0              0                  0    186
    ## 131  37        0                     1              0                  0    182
    ## 132  66        1                     1              0                  0    188
    ## 133  51        1                     0              0                  0    183
    ## 134  48        0                     1              1                  1    176
    ## 135  40        0                     0              0                  0    156
    ## 136  54        1                     0              0                  0    151
    ## 137  33        1                     1              0                  0    149
    ## 138  33        0                     1              0                  0    159
    ## 139  59        1                     1              0                  0    185
    ## 140  52        1                     0              0                  0    187
    ## 141  35        0                     0              0                  0    180
    ## 142  59        0                     1              1                  0    149
    ## 143  53        1                     1              0                  1    154
    ## 144  50        1                     1              0                  0    147
    ## 145  56        0                     1              0                  0    167
    ## 146  47        0                     0              0                  0    169
    ## 147  57        1                     1              0                  0    166
    ## 148  42        0                     0              0                  0    171
    ## 149  21        0                     0              0                  0    157
    ## 150  62        1                     0              0                  1    167
    ## 151  62        1                     1              0                  0    164
    ## 152  20        0                     0              0                  0    174
    ## 153  43        0                     0              0                  0    158
    ## 154  46        1                     0              0                  0    175
    ## 155  58        1                     1              0                  0    180
    ## 156  19        0                     0              0                  0    165
    ## 157  34        1                     1              0                  0    182
    ## 158  53        1                     0              0                  0    168
    ## 159  29        0                     0              0                  0    180
    ## 160  32        0                     0              0                  0    167
    ## 161  18        0                     0              0                  0    164
    ## 162  28        1                     0              0                  0    181
    ## 163  44        0                     0              0                  0    175
    ## 164  42        1                     0              1                  0    170
    ## 165  48        0                     1              0                  1    156
    ## 166  30        1                     1              0                  0    161
    ## 167  31        1                     1              0                  0    171
    ## 168  47        1                     0              1                  0    168
    ## 169  24        1                     0              0                  0    178
    ## 170  55        0                     0              0                  0    162
    ## 171  42        0                     0              0                  0    176
    ## 172  35        0                     1              0                  0    174
    ## 173  33        1                     1              0                  0    164
    ## 174  66        1                     0              0                  0    164
    ## 175  38        0                     0              0                  1    165
    ## 176  37        1                     1              0                  1    180
    ## 177  30        0                     0              0                  1    160
    ## 178  36        0                     0              0                  0    156
    ## 179  30        1                     1              0                  0    161
    ## 180  46        1                     0              0                  1    174
    ## 181  19        0                     0              0                  0    173
    ## 182  25        1                     1              1                  0    157
    ## 183  35        1                     0              0                  0    164
    ## 184  30        0                     1              0                  0    174
    ## 185  48        0                     0              0                  0    176
    ## 186  50        1                     0              0                  0    163
    ## 187  33        0                     0              0                  0    161
    ## 188  43        1                     0              0                  0    165
    ## 189  19        0                     0              0                  0    164
    ## 190  39        0                     1              0                  0    174
    ## 191  45        1                     1              0                  0    179
    ## 192  48        1                     0              0                  0    182
    ## 193  20        1                     1              0                  0    172
    ## 194  40        1                     1              0                  0    170
    ## 195  32        1                     1              0                  1    176
    ## 196  30        0                     0              0                  0    177
    ## 197  24        0                     1              0                  0    173
    ## 198  27        0                     1              0                  0    159
    ## 199  60        0                     0              0                  0    172
    ## 200  31        1                     1              0                  0    174
    ## 201  18        0                     0              0                  0    172
    ## 202  32        0                     1              0                  0    176
    ## 203  49        1                     0              0                  0    160
    ## 204  41        0                     0              0                  1    178
    ## 205  29        0                     0              0                  1    174
    ## 206  60        1                     0              0                  0    175
    ## 207  46        0                     0              0                  0    170
    ## 208  52        0                     1              0                  0    167
    ## 209  22        0                     0              0                  0    168
    ## 210  66        1                     1              0                  0    175
    ## 211  65        0                     1              0                  0    177
    ## 212  62        0                     1              1                  0    164
    ## 213  35        0                     0              0                  1    173
    ## 214  50        1                     1              0                  1    163
    ## 215  61        0                     1              0                  1    174
    ## 216  49        0                     1              0                  0    162
    ## 217  25        1                     1              0                  0    176
    ## 218  37        0                     0              0                  0    159
    ## 219  57        1                     0              0                  0    160
    ## 220  60        0                     1              0                  0    177
    ## 221  44        0                     0              0                  0    182
    ## 222  22        1                     1              0                  0    166
    ## 223  56        1                     1              0                  1    177
    ## 224  63        1                     1              0                  0    167
    ## 225  36        1                     0              0                  0    180
    ## 226  53        0                     0              0                  0    168
    ## 227  29        1                     1              0                  1    172
    ## 228  32        0                     0              0                  0    160
    ## 229  18        0                     0              0                  0    160
    ## 230  35        0                     1              0                  0    161
    ## 231  34        0                     0              0                  0    158
    ## 232  62        0                     1              0                  1    175
    ## 233  54        1                     0              0                  1    161
    ## 234  49        0                     1              0                  0    177
    ## 235  21        1                     0              0                  0    174
    ## 236  20        0                     0              0                  0    173
    ## 237  49        0                     1              0                  0    179
    ## 238  47        1                     1              0                  0    161
    ## 239  55        1                     0              0                  0    169
    ## 240  29        0                     0              0                  0    171
    ## 241  52        0                     1              0                  0    181
    ## 242  47        0                     1              0                  1    166
    ## 243  19        0                     0              0                  0    169
    ## 244  25        0                     1              0                  0    170
    ## 245  65        1                     0              0                  1    168
    ## 246  32        0                     0              0                  0    164
    ## 247  53        1                     0              0                  0    173
    ## 248  60        1                     0              0                  0    159
    ## 249  37        0                     0              0                  1    173
    ## 250  22        0                     1              0                  0    164
    ## 251  57        0                     0              0                  0    158
    ## 252  33        0                     0              0                  0    174
    ## 253  48        1                     0              0                  0    173
    ## 254  25        0                     0              0                  0    182
    ## 255  54        1                     1              0                  0    160
    ## 256  36        1                     0              0                  0    180
    ## 257  24        1                     0              0                  0    178
    ## 258  24        1                     0              0                  0    159
    ## 259  55        0                     1              0                  0    182
    ## 260  30        1                     1              0                  1    182
    ## 261  40        0                     1              0                  1    163
    ## 262  49        0                     0              0                  0    169
    ## 263  46        0                     1              0                  1    166
    ## 264  62        1                     1              0                  0    181
    ## 265  44        1                     1              0                  1    177
    ## 266  36        1                     0              0                  0    163
    ## 267  64        1                     0              0                  0    163
    ## 268  48        1                     1              0                  0    171
    ## 269  20        0                     0              0                  0    181
    ## 270  28        0                     0              0                  1    179
    ## 271  46        0                     0              0                  0    168
    ## 272  52        1                     0              0                  0    157
    ## 273  18        1                     1              0                  0    169
    ## 274  35        1                     1              0                  0    182
    ## 275  64        1                     0              0                  0    175
    ## 276  66        0                     1              0                  0    159
    ## 277  50        0                     1              0                  1    165
    ## 278  48        0                     1              0                  0    172
    ## 279  66        1                     1              0                  0    157
    ## 280  52        0                     0              0                  0    180
    ## 281  48        1                     1              0                  0    168
    ## 282  64        0                     1              1                  0    176
    ## 283  49        0                     0              0                  0    162
    ## 284  29        0                     0              0                  0    156
    ## 285  43        1                     0              0                  0    173
    ## 286  45        0                     1              0                  0    174
    ## 287  40        0                     0              1                  0    164
    ## 288  64        1                     1              0                  1    163
    ## 289  40        0                     1              0                  0    158
    ## 290  32        0                     0              0                  0    163
    ## 291  52        1                     1              0                  0    158
    ## 292  35        0                     1              0                  0    168
    ## 293  26        1                     0              0                  0    181
    ## 294  25        0                     1              0                  0    179
    ## 295  25        0                     1              0                  0    176
    ## 296  40        0                     1              0                  0    157
    ## 297  26        0                     0              0                  0    157
    ## 298  43        0                     0              0                  0    169
    ## 299  56        0                     0              0                  0    169
    ## 300  38        1                     1              0                  1    180
    ## 301  65        1                     1              0                  0    168
    ## 302  64        1                     0              0                  0    177
    ## 303  23        0                     0              0                  0    166
    ## 304  25        1                     0              0                  0    181
    ## 305  36        0                     1              0                  1    166
    ## 306  40        0                     0              0                  0    162
    ## 307  59        1                     1              1                  0    158
    ## 308  32        0                     0              0                  1    182
    ## 309  52        1                     1              0                  0    168
    ## 310  53        0                     0              0                  0    156
    ## 311  55        1                     0              1                  0    159
    ## 312  42        1                     1              0                  0    182
    ## 313  28        0                     0              0                  1    179
    ## 314  33        0                     0              0                  0    177
    ## 315  34        0                     1              0                  0    160
    ## 316  24        0                     0              0                  0    172
    ## 317  61        1                     1              0                  0    156
    ## 318  29        1                     0              0                  0    162
    ## 319  48        0                     1              0                  0    173
    ## 320  38        0                     0              0                  1    182
    ## 321  51        0                     1              0                  0    179
    ## 322  61        0                     1              0                  0    166
    ## 323  30        0                     0              0                  0    166
    ## 324  57        0                     0              0                  0    164
    ## 325  63        0                     1              0                  0    182
    ## 326  43        1                     1              0                  1    179
    ## 327  31        0                     1              0                  0    162
    ## 328  55        1                     1              0                  0    161
    ## 329  19        0                     0              0                  0    166
    ## 330  50        1                     1              0                  1    167
    ## 331  45        1                     1              0                  1    177
    ## 332  47        1                     1              0                  0    174
    ## 333  47        1                     0              0                  1    180
    ## 334  43        1                     0              0                  0    176
    ## 335  48        0                     1              0                  0    175
    ## 336  25        1                     1              0                  0    159
    ## 337  34        1                     0              0                  0    178
    ## 338  47        1                     1              0                  1    181
    ## 339  22        1                     0              0                  0    166
    ## 340  34        0                     0              0                  0    161
    ## 341  63        0                     1              0                  0    173
    ## 342  51        1                     1              0                  1    180
    ## 343  48        1                     0              0                  0    164
    ## 344  33        0                     1              0                  1    177
    ## 345  42        1                     0              0                  0    167
    ## 346  19        0                     0              0                  0    172
    ## 347  42        0                     1              0                  0    169
    ## 348  65        1                     0              0                  0    158
    ## 349  47        1                     0              0                  0    157
    ## 350  41        0                     1              0                  1    182
    ## 351  45        0                     0              0                  1    171
    ## 352  49        1                     0              0                  0    158
    ## 353  42        1                     1              0                  0    171
    ## 354  34        0                     0              0                  1    177
    ## 355  37        0                     0              0                  0    178
    ## 356  43        0                     1              0                  1    181
    ## 357  46        0                     1              0                  0    159
    ## 358  54        1                     0              0                  0    170
    ## 359  48        0                     1              0                  0    169
    ## 360  52        0                     0              0                  0    176
    ## 361  35        0                     1              0                  0    162
    ## 362  36        0                     1              1                  1    164
    ## 363  62        0                     1              0                  0    179
    ## 364  64        1                     1              0                  0    175
    ## 365  25        0                     1              0                  0    166
    ## 366  62        0                     1              0                  0    163
    ## 367  29        1                     0              0                  0    162
    ## 368  37        1                     0              0                  0    166
    ## 369  43        0                     1              0                  0    158
    ## 370  61        1                     0              0                  0    163
    ## 371  54        0                     0              0                  0    156
    ## 372  41        1                     1              0                  0    162
    ## 373  62        1                     1              0                  0    175
    ## 374  43        1                     1              0                  1    156
    ## 375  19        0                     0              0                  0    164
    ## 376  38        0                     0              0                  1    180
    ## 377  45        0                     1              0                  1    158
    ## 378  54        1                     1              0                  0    174
    ## 379  29        0                     1              0                  1    166
    ## 380  62        0                     1              0                  0    159
    ## 381  54        0                     1              0                  0    170
    ## 382  45        1                     0              0                  0    157
    ## 383  64        1                     1              0                  0    159
    ## 384  40        0                     1              0                  0    161
    ## 385  35        0                     1              0                  0    180
    ## 386  58        1                     1              0                  0    173
    ## 387  57        1                     1              0                  0    156
    ## 388  28        1                     1              1                  1    156
    ## 389  33        0                     1              1                  1    159
    ## 390  32        0                     0              0                  1    164
    ## 391  66        1                     1              0                  0    163
    ## 392  43        0                     0              0                  0    182
    ## 393  32        0                     1              0                  0    157
    ## 394  65        1                     1              0                  0    167
    ## 395  34        0                     1              0                  1    165
    ## 396  55        1                     1              0                  0    156
    ## 397  64        1                     1              0                  0    181
    ## 398  44        0                     0              0                  1    171
    ## 399  35        1                     0              0                  0    162
    ## 400  38        0                     0              0                  0    181
    ## 401  45        1                     1              0                  0    160
    ## 402  39        1                     1              0                  0    174
    ## 403  59        1                     1              0                  0    164
    ## 404  36        1                     0              0                  0    167
    ## 405  61        1                     0              0                  0    168
    ## 406  33        1                     1              0                  0    163
    ## 407  44        1                     1              0                  0    160
    ## 408  31        1                     0              0                  0    162
    ## 409  18        0                     1              0                  0    172
    ## 410  45        0                     0              0                  0    176
    ## 411  34        0                     0              0                  0    177
    ## 412  37        1                     0              0                  0    156
    ## 413  29        0                     0              0                  0    166
    ## 414  36        0                     0              0                  0    165
    ## 415  22        0                     0              0                  0    162
    ## 416  20        0                     0              0                  0    175
    ## 417  61        0                     1              0                  0    172
    ## 418  49        0                     0              0                  0    165
    ## 419  27        1                     0              0                  0    168
    ## 420  59        1                     1              0                  0    168
    ## 421  23        0                     1              0                  0    169
    ## 422  21        1                     1              0                  0    173
    ## 423  58        1                     1              0                  0    159
    ## 424  37        0                     1              0                  0    158
    ## 425  24        0                     0              0                  0    160
    ## 426  44        0                     0              0                  1    160
    ## 427  50        1                     0              0                  0    164
    ## 428  37        1                     0              0                  0    174
    ## 429  29        0                     0              0                  0    179
    ## 430  37        0                     0              0                  1    170
    ## 431  24        1                     0              1                  0    173
    ## 432  65        0                     1              1                  0    179
    ## 433  48        0                     1              0                  0    172
    ## 434  64        0                     1              0                  0    174
    ## 435  22        1                     0              0                  0    158
    ## 436  39        0                     0              0                  0    161
    ## 437  19        0                     0              0                  0    158
    ## 438  18        1                     1              0                  0    176
    ## 439  59        0                     1              0                  0    162
    ## 440  60        0                     1              0                  0    171
    ## 441  27        0                     0              0                  0    162
    ## 442  50        0                     0              0                  0    158
    ## 443  20        1                     0              0                  0    181
    ## 444  39        0                     0              0                  1    185
    ## 445  64        1                     1              0                  0    179
    ## 446  58        0                     1              1                  0    163
    ## 447  32        0                     0              0                  0    184
    ## 448  19        0                     0              0                  0    176
    ## 449  19        1                     0              0                  0    183
    ## 450  22        0                     0              0                  0    174
    ## 451  61        1                     0              0                  0    178
    ## 452  58        0                     0              1                  0    179
    ## 453  29        1                     0              0                  0    174
    ## 454  56        1                     1              0                  0    177
    ## 455  24        0                     1              0                  0    180
    ## 456  65        1                     0              0                  0    184
    ## 457  24        1                     1              1                  0    166
    ## 458  48        0                     0              0                  1    175
    ## 459  42        1                     0              0                  0    186
    ## 460  44        1                     0              0                  0    168
    ## 461  26        1                     1              0                  0    167
    ## 462  49        0                     1              0                  1    185
    ## 463  35        1                     0              0                  0    173
    ## 464  58        1                     1              0                  0    165
    ## 465  47        0                     1              0                  0    170
    ## 466  57        0                     0              0                  1    165
    ## 467  46        0                     1              0                  0    174
    ## 468  41        1                     1              0                  0    167
    ## 469  18        0                     0              0                  0    181
    ## 470  49        1                     1              0                  0    166
    ## 471  32        0                     0              0                  0    185
    ## 472  45        1                     0              0                  1    181
    ## 473  27        0                     0              0                  0    165
    ## 474  56        1                     0              0                  0    168
    ## 475  42        0                     0              0                  0    183
    ## 476  64        0                     1              0                  1    180
    ## 477  58        1                     0              0                  0    176
    ## 478  56        0                     0              0                  1    184
    ## 479  58        0                     1              0                  0    180
    ## 480  45        0                     1              0                  0    167
    ## 481  45        0                     0              0                  1    175
    ## 482  30        0                     0              0                  0    166
    ## 483  33        0                     1              0                  0    170
    ## 484  59        1                     1              0                  0    175
    ## 485  27        1                     0              0                  0    184
    ## 486  30        0                     1              0                  0    174
    ## 487  64        1                     1              0                  0    178
    ## 488  34        0                     1              0                  0    172
    ## 489  51        0                     1              0                  0    174
    ## 490  35        0                     0              0                  0    184
    ## 491  62        0                     1              0                  0    167
    ## 492  46        1                     1              0                  0    168
    ## 493  45        0                     0              0                  0    172
    ## 494  26        0                     0              0                  1    184
    ## 495  50        1                     0              0                  0    168
    ## 496  64        1                     1              0                  0    180
    ## 497  52        1                     0              1                  0    183
    ## 498  36        0                     0              0                  0    178
    ## 499  54        0                     0              0                  0    184
    ## 500  49        0                     0              0                  0    185
    ## 501  51        0                     0              0                  0    176
    ## 502  64        1                     0              0                  0    178
    ## 503  21        0                     0              0                  0    182
    ## 504  35        1                     1              0                  0    169
    ## 505  19        1                     1              0                  0    172
    ## 506  63        0                     1              0                  0    175
    ## 507  39        1                     1              0                  0    169
    ## 508  43        0                     0              0                  0    165
    ## 509  47        0                     0              0                  0    166
    ## 510  61        1                     0              0                  0    178
    ## 511  42        1                     1              0                  0    176
    ## 512  20        0                     0              0                  0    166
    ## 513  18        1                     1              0                  0    183
    ## 514  50        0                     1              0                  0    167
    ## 515  52        1                     0              0                  0    184
    ## 516  35        0                     1              0                  0    169
    ## 517  21        1                     1              0                  0    167
    ## 518  37        0                     0              0                  0    183
    ## 519  54        1                     1              0                  1    182
    ## 520  42        0                     0              0                  0    185
    ## 521  51        0                     0              1                  0    181
    ## 522  31        0                     1              0                  0    171
    ## 523  28        0                     0              0                  0    185
    ## 524  28        1                     0              0                  0    167
    ## 525  49        0                     0              0                  0    178
    ## 526  46        1                     1              0                  0    173
    ## 527  38        0                     1              0                  0    163
    ## 528  46        0                     0              0                  0    169
    ## 529  65        0                     1              0                  0    177
    ## 530  25        1                     1              0                  1    163
    ## 531  25        0                     0              0                  0    165
    ## 532  62        0                     1              0                  0    182
    ## 533  54        1                     0              0                  0    182
    ## 534  59        1                     0              0                  0    176
    ## 535  64        1                     0              0                  0    168
    ## 536  63        0                     1              0                  0    164
    ## 537  61        1                     1              0                  0    167
    ## 538  47        0                     0              0                  0    174
    ## 539  41        1                     1              0                  0    185
    ## 540  59        0                     0              0                  0    183
    ## 541  18        0                     1              0                  0    163
    ## 542  28        0                     0              0                  1    169
    ## 543  66        1                     1              0                  0    168
    ## 544  58        1                     1              0                  0    172
    ## 545  59        1                     1              0                  0    174
    ## 546  64        0                     1              0                  0    181
    ## 547  63        1                     1              0                  0    168
    ## 548  37        0                     0              0                  1    186
    ## 549  18        0                     1              0                  0    169
    ## 550  29        0                     0              0                  0    165
    ## 551  42        1                     1              0                  0    185
    ## 552  22        0                     1              0                  0    178
    ## 553  36        1                     1              0                  0    183
    ## 554  37        1                     1              0                  1    180
    ## 555  32        0                     1              0                  0    181
    ## 556  51        0                     0              0                  1    180
    ## 557  61        0                     1              0                  0    163
    ## 558  27        0                     0              0                  0    183
    ## 559  55        0                     0              0                  0    167
    ## 560  66        0                     1              0                  1    169
    ## 561  58        1                     0              0                  0    180
    ## 562  60        0                     1              0                  0    181
    ## 563  43        0                     1              1                  1    177
    ## 564  54        0                     0              0                  0    179
    ## 565  19        0                     0              0                  0    163
    ## 566  66        1                     1              0                  1    176
    ## 567  51        0                     0              0                  0    166
    ## 568  34        1                     1              0                  0    170
    ## 569  43        1                     1              0                  0    166
    ## 570  30        0                     1              0                  0    166
    ## 571  41        1                     1              0                  0    168
    ## 572  18        0                     0              0                  0    172
    ## 573  49        1                     1              0                  1    183
    ## 574  50        0                     0              0                  0    185
    ## 575  43        0                     0              0                  0    176
    ## 576  42        0                     0              0                  1    173
    ## 577  43        0                     0              0                  1    176
    ## 578  29        0                     1              0                  0    171
    ## 579  31        0                     1              0                  0    175
    ## 580  42        0                     0              0                  1    185
    ## 581  31        0                     0              0                  1    165
    ## 582  41        0                     0              0                  1    183
    ## 583  31        0                     1              0                  0    167
    ## 584  47        0                     0              0                  0    181
    ## 585  27        1                     1              0                  0    176
    ## 586  44        0                     1              0                  1    180
    ## 587  58        1                     0              0                  0    179
    ## 588  27        0                     0              0                  0    170
    ## 589  55        0                     1              0                  0    172
    ## 590  51        0                     1              0                  0    166
    ## 591  22        1                     1              0                  0    172
    ## 592  28        1                     0              0                  0    178
    ## 593  44        1                     0              0                  0    184
    ## 594  49        0                     1              0                  0    185
    ## 595  46        1                     0              0                  0    167
    ## 596  26        0                     1              0                  1    178
    ## 597  62        0                     0              0                  0    177
    ## 598  27        0                     0              0                  0    166
    ## 599  45        0                     1              0                  0    165
    ## 600  60        0                     0              0                  0    164
    ## 601  61        0                     1              0                  0    174
    ## 602  58        1                     1              0                  0    178
    ## 603  27        0                     0              0                  0    186
    ## 604  50        0                     0              0                  0    165
    ## 605  57        1                     1              0                  0    170
    ## 606  59        1                     0              0                  0    167
    ## 607  43        0                     0              0                  1    169
    ## 608  21        0                     1              0                  0    165
    ## 609  42        0                     1              0                  0    174
    ## 610  59        1                     1              0                  0    172
    ## 611  24        1                     1              0                  0    176
    ## 612  32        0                     1              1                  0    181
    ## 613  45        1                     0              0                  0    184
    ## 614  42        1                     0              0                  0    166
    ## 615  34        0                     0              1                  0    184
    ## 616  45        1                     0              0                  0    179
    ## 617  28        0                     0              0                  1    180
    ## 618  36        0                     0              0                  0    165
    ## 619  24        1                     0              0                  0    170
    ## 620  41        0                     0              0                  1    172
    ## 621  41        0                     0              0                  0    163
    ## 622  48        1                     0              0                  1    164
    ## 623  41        0                     0              0                  1    177
    ## 624  51        1                     1              0                  1    181
    ## 625  27        0                     0              0                  0    186
    ## 626  35        1                     0              0                  0    167
    ## 627  40        0                     0              0                  0    178
    ## 628  41        1                     1              0                  1    169
    ## 629  21        1                     0              0                  0    173
    ## 630  44        1                     0              0                  0    165
    ## 631  36        1                     1              0                  0    166
    ## 632  45        1                     0              0                  0    172
    ## 633  44        1                     0              0                  0    184
    ## 634  51        0                     1              0                  0    165
    ## 635  20        0                     0              0                  0    170
    ## 636  63        1                     1              0                  0    179
    ## 637  51        0                     1              0                  0    166
    ## 638  22        0                     0              0                  0    182
    ## 639  63        1                     1              0                  0    184
    ## 640  42        1                     0              0                  0    166
    ## 641  59        0                     1              0                  1    163
    ## 642  21        0                     1              0                  0    179
    ## 643  30        1                     1              0                  1    166
    ## 644  43        0                     0              0                  0    169
    ## 645  42        1                     1              0                  0    176
    ## 646  63        1                     1              0                  0    179
    ## 647  39        0                     0              0                  0    170
    ## 648  63        0                     0              0                  0    170
    ## 649  66        1                     0              0                  0    185
    ## 650  44        0                     0              0                  0    179
    ## 651  28        0                     0              0                  0    165
    ## 652  38        0                     1              0                  0    179
    ## 653  53        1                     0              0                  0    164
    ## 654  43        0                     0              0                  0    175
    ## 655  21        0                     0              0                  0    178
    ## 656  50        0                     1              1                  0    176
    ## 657  66        1                     1              0                  0    164
    ## 658  27        1                     1              0                  0    173
    ## 659  49        0                     1              0                  0    163
    ## 660  40        1                     0              0                  0    182
    ## 661  31        0                     0              0                  1    175
    ## 662  59        0                     1              0                  0    185
    ## 663  43        1                     0              0                  0    180
    ## 664  51        1                     1              0                  0    174
    ## 665  22        0                     0              0                  0    185
    ## 666  61        0                     0              0                  0    184
    ## 667  66        1                     0              0                  1    165
    ## 668  65        0                     1              0                  0    171
    ## 669  54        0                     1              0                  0    184
    ## 670  34        0                     0              0                  0    184
    ## 671  66        0                     1              0                  0    183
    ## 672  59        0                     0              1                  1    179
    ## 673  24        1                     0              0                  0    174
    ## 674  42        0                     1              0                  0    164
    ## 675  44        0                     0              0                  0    176
    ## 676  49        1                     1              0                  0    174
    ## 677  46        1                     1              0                  0    184
    ## 678  47        0                     0              0                  1    184
    ## 679  53        0                     0              0                  0    165
    ## 680  35        0                     0              0                  0    183
    ## 681  20        0                     0              0                  0    163
    ## 682  48        1                     1              0                  0    186
    ## 683  66        1                     0              0                  0    168
    ## 684  43        0                     0              0                  1    170
    ## 685  27        0                     0              0                  0    181
    ## 686  22        0                     0              0                  0    165
    ## 687  56        1                     0              0                  0    167
    ## 688  59        0                     1              0                  0    184
    ## 689  60        1                     0              0                  1    174
    ## 690  49        1                     1              0                  1    164
    ## 691  29        0                     1              0                  0    182
    ## 692  43        1                     1              0                  0    166
    ## 693  46        1                     1              0                  1    173
    ## 694  50        1                     0              0                  0    176
    ## 695  29        0                     0              0                  0    163
    ## 696  56        1                     0              1                  0    185
    ## 697  33        0                     0              0                  0    185
    ## 698  41        1                     0              0                  0    164
    ## 699  38        0                     0              0                  0    163
    ## 700  59        0                     1              0                  0    173
    ## 701  57        0                     1              0                  1    179
    ## 702  62        1                     0              0                  0    178
    ## 703  32        0                     0              1                  1    171
    ## 704  54        0                     1              0                  0    175
    ## 705  50        1                     1              0                  0    175
    ## 706  55        1                     1              0                  0    169
    ## 707  51        1                     1              0                  0    163
    ## 708  37        0                     0              0                  0    163
    ## 709  18        0                     0              0                  0    172
    ## 710  56        1                     1              0                  0    171
    ## 711  38        0                     0              0                  0    178
    ## 712  48        0                     0              0                  1    163
    ## 713  60        0                     1              0                  1    179
    ## 714  45        1                     1              0                  0    176
    ## 715  23        0                     0              0                  0    173
    ## 716  57        1                     1              0                  0    164
    ## 717  39        0                     0              0                  0    172
    ## 718  65        1                     1              0                  0    165
    ## 719  50        1                     0              0                  0    177
    ## 720  56        0                     1              0                  0    165
    ## 721  27        1                     0              0                  0    177
    ## 722  50        0                     0              0                  0    169
    ## 723  66        1                     1              0                  0    185
    ## 724  53        1                     1              0                  1    171
    ## 725  26        1                     1              0                  1    179
    ## 726  25        0                     1              0                  0    170
    ## 727  27        0                     0              1                  1    168
    ## 728  19        0                     0              0                  0    171
    ## 729  56        0                     1              0                  0    175
    ## 730  33        0                     0              0                  1    174
    ## 731  19        1                     0              0                  0    164
    ## 732  24        1                     1              0                  0    166
    ## 733  24        0                     0              1                  0    176
    ## 734  42        0                     0              0                  0    186
    ## 735  42        0                     0              0                  1    185
    ## 736  20        1                     0              0                  0    179
    ## 737  21        0                     0              0                  0    154
    ## 738  65        1                     1              0                  0    155
    ## 739  30        0                     1              0                  0    159
    ## 740  32        0                     0              0                  1    159
    ## 741  53        0                     1              0                  1    177
    ## 742  64        0                     1              0                  0    170
    ## 743  44        0                     0              0                  0    176
    ## 744  46        1                     1              0                  1    175
    ## 745  27        1                     1              0                  0    161
    ## 746  43        0                     1              0                  0    171
    ## 747  23        0                     1              0                  0    147
    ## 748  19        0                     0              0                  0    146
    ## 749  43        1                     0              0                  0    172
    ## 750  18        1                     1              0                  0    169
    ## 751  25        0                     1              0                  1    164
    ## 752  59        0                     0              0                  0    149
    ## 753  59        0                     1              0                  0    162
    ## 754  30        1                     1              0                  1    164
    ## 755  59        1                     1              0                  0    170
    ## 756  53        0                     1              0                  1    175
    ## 757  40        1                     1              0                  1    156
    ## 758  41        1                     0              0                  0    156
    ## 759  49        1                     0              0                  0    159
    ## 760  47        1                     0              0                  0    162
    ## 761  65        1                     1              0                  0    149
    ## 762  42        0                     0              0                  1    149
    ## 763  42        1                     1              0                  0    153
    ## 764  41        0                     1              0                  0    161
    ## 765  45        0                     1              0                  0    172
    ## 766  34        0                     0              0                  0    177
    ## 767  32        1                     0              0                  0    164
    ## 768  24        1                     0              0                  0    149
    ## 769  63        0                     1              0                  1    159
    ## 770  56        0                     1              0                  0    164
    ## 771  60        0                     1              0                  0    159
    ## 772  27        0                     0              0                  0    151
    ## 773  30        0                     0              1                  0    158
    ## 774  47        1                     1              0                  0    150
    ## 775  36        1                     0              0                  0    166
    ## 776  58        0                     1              0                  0    159
    ## 777  20        1                     0              0                  0    171
    ## 778  32        0                     0              0                  1    145
    ## 779  33        0                     1              0                  0    154
    ## 780  18        0                     0              0                  0    148
    ## 781  29        0                     0              0                  1    151
    ## 782  34        0                     0              0                  1    164
    ## 783  57        1                     1              0                  0    162
    ## 784  44        0                     0              0                  0    155
    ## 785  33        0                     0              0                  0    176
    ## 786  24        1                     0              1                  0    162
    ## 787  22        0                     1              0                  0    156
    ## 788  36        0                     0              0                  0    174
    ## 789  44        0                     1              1                  0    151
    ## 790  29        1                     0              0                  0    178
    ## 791  27        0                     0              0                  1    177
    ## 792  62        1                     0              0                  0    156
    ## 793  33        0                     0              0                  1    146
    ## 794  48        0                     0              0                  1    161
    ## 795  25        0                     1              0                  0    173
    ## 796  35        0                     0              0                  1    165
    ## 797  62        0                     0              0                  0    169
    ## 798  33        0                     0              0                  0    153
    ## 799  47        0                     0              0                  1    177
    ## 800  48        0                     0              0                  0    161
    ## 801  42        0                     0              0                  0    175
    ## 802  65        1                     0              1                  0    171
    ## 803  65        1                     0              0                  0    165
    ## 804  50        0                     0              0                  0    147
    ## 805  65        1                     1              0                  0    169
    ## 806  18        0                     1              0                  0    163
    ## 807  62        1                     1              0                  0    150
    ## 808  36        1                     1              0                  0    157
    ## 809  32        0                     1              0                  0    177
    ## 810  52        0                     1              0                  1    148
    ## 811  27        0                     0              0                  0    175
    ## 812  65        1                     1              0                  0    158
    ## 813  31        0                     0              0                  0    150
    ## 814  52        1                     1              0                  0    176
    ## 815  26        0                     0              0                  1    147
    ## 816  40        0                     0              0                  0    170
    ## 817  25        1                     0              0                  0    151
    ## 818  21        0                     1              0                  0    156
    ## 819  21        0                     0              0                  0    176
    ## 820  29        1                     0              0                  0    145
    ## 821  50        0                     1              0                  0    164
    ## 822  44        0                     0              0                  0    174
    ## 823  56        1                     1              0                  1    159
    ## 824  48        0                     0              0                  0    150
    ## 825  56        1                     0              1                  0    149
    ## 826  50        0                     0              0                  1    174
    ## 827  18        0                     0              0                  0    154
    ## 828  41        0                     0              0                  0    166
    ## 829  35        0                     1              0                  0    160
    ## 830  24        1                     0              0                  0    174
    ## 831  22        0                     0              0                  0    169
    ## 832  20        0                     0              0                  0    169
    ## 833  48        1                     0              0                  0    153
    ## 834  18        0                     0              0                  0    170
    ## 835  61        0                     1              0                  1    163
    ## 836  37        1                     1              0                  0    150
    ## 837  54        0                     1              0                  1    156
    ## 838  29        1                     0              0                  0    156
    ## 839  21        0                     0              0                  0    170
    ## 840  55        0                     0              0                  0    153
    ## 841  65        0                     1              0                  1    166
    ## 842  28        1                     0              0                  0    160
    ## 843  61        1                     0              0                  0    161
    ## 844  44        0                     0              0                  0    162
    ## 845  53        0                     1              0                  1    172
    ## 846  25        0                     0              1                  0    175
    ## 847  33        1                     1              0                  0    169
    ## 848  66        0                     1              1                  0    154
    ## 849  28        1                     1              0                  0    147
    ## 850  62        1                     1              0                  0    166
    ## 851  25        0                     0              0                  0    164
    ## 852  18        0                     1              0                  0    164
    ## 853  39        1                     0              0                  0    168
    ## 854  28        1                     0              0                  0    175
    ## 855  42        0                     0              0                  0    155
    ## 856  35        1                     0              0                  0    173
    ## 857  48        1                     0              0                  0    150
    ## 858  51        1                     1              0                  0    164
    ## 859  23        0                     0              0                  0    148
    ## 860  31        1                     1              0                  0    147
    ## 861  44        0                     0              0                  1    148
    ## 862  51        0                     1              0                  0    170
    ## 863  37        0                     1              0                  1    165
    ## 864  22        0                     1              0                  0    171
    ## 865  46        0                     0              0                  1    154
    ## 866  22        1                     0              0                  0    157
    ## 867  52        0                     0              0                  0    170
    ## 868  32        1                     1              0                  0    161
    ## 869  45        1                     1              0                  0    164
    ## 870  43        0                     1              0                  0    151
    ## 871  58        1                     0              0                  0    147
    ## 872  42        1                     1              0                  0    147
    ## 873  62        0                     1              0                  0    158
    ## 874  45        0                     0              0                  0    164
    ## 875  47        0                     1              0                  0    175
    ## 876  27        0                     0              0                  0    170
    ## 877  18        0                     0              0                  0    153
    ## 878  55        0                     1              0                  0    160
    ## 879  38        1                     0              0                  0    171
    ## 880  51        0                     1              0                  0    178
    ## 881  19        1                     0              0                  0    150
    ## 882  34        1                     1              0                  1    157
    ## 883  57        1                     1              0                  1    166
    ## 884  34        0                     0              0                  0    149
    ## 885  39        1                     1              0                  1    175
    ## 886  55        1                     0              1                  0    170
    ## 887  30        0                     1              0                  0    159
    ## 888  62        0                     0              0                  1    162
    ## 889  25        0                     1              0                  0    177
    ## 890  19        0                     0              0                  0    154
    ## 891  51        0                     1              0                  0    153
    ## 892  30        1                     1              0                  0    177
    ## 893  40        0                     0              0                  0    151
    ## 894  21        0                     0              0                  0    149
    ## 895  54        0                     1              1                  1    156
    ## 896  63        1                     1              0                  0    163
    ## 897  66        1                     1              0                  0    178
    ## 898  43        1                     0              0                  0    173
    ## 899  47        0                     1              0                  0    172
    ## 900  29        0                     0              0                  0    170
    ## 901  53        1                     0              0                  0    145
    ## 902  33        0                     0              1                  0    162
    ## 903  21        0                     0              0                  0    148
    ## 904  62        1                     1              0                  0    159
    ## 905  41        1                     0              0                  0    148
    ## 906  24        0                     1              0                  0    159
    ## 907  31        0                     0              1                  0    154
    ## 908  19        0                     0              0                  0    171
    ## 909  22        0                     1              0                  0    175
    ## 910  41        1                     1              0                  0    164
    ## 911  61        0                     1              0                  1    156
    ## 912  42        0                     0              1                  0    156
    ## 913  54        0                     1              0                  0    161
    ## 914  54        1                     1              0                  0    160
    ## 915  38        0                     1              0                  1    170
    ## 916  19        1                     0              0                  0    165
    ## 917  48        1                     1              0                  1    168
    ## 918  31        0                     0              1                  1    174
    ## 919  43        0                     0              0                  0    159
    ## 920  40        1                     1              0                  1    155
    ## 921  35        1                     0              0                  0    176
    ## 922  53        0                     0              0                  0    173
    ## 923  43        0                     0              0                  0    166
    ## 924  55        0                     0              0                  0    157
    ## 925  45        0                     1              0                  0    165
    ## 926  29        0                     0              0                  0    154
    ## 927  60        1                     1              0                  0    155
    ## 928  30        1                     1              0                  0    152
    ## 929  52        1                     1              0                  0    161
    ## 930  25        0                     0              1                  0    161
    ## 931  62        1                     1              0                  0    157
    ## 932  63        1                     1              0                  0    158
    ## 933  21        1                     0              0                  0    147
    ## 934  46        1                     1              0                  0    146
    ## 935  27        1                     1              0                  0    155
    ## 936  18        0                     0              0                  0    162
    ## 937  66        0                     1              0                  0    153
    ## 938  42        0                     0              0                  0    175
    ## 939  59        1                     1              0                  0    154
    ## 940  32        1                     1              0                  0    166
    ## 941  27        1                     0              0                  0    162
    ## 942  35        1                     1              0                  0    165
    ## 943  66        0                     1              0                  1    176
    ## 944  42        1                     1              0                  0    152
    ## 945  18        0                     0              0                  0    160
    ## 946  45        0                     1              0                  0    168
    ## 947  46        1                     1              0                  0    168
    ## 948  26        0                     0              0                  0    178
    ## 949  31        0                     1              0                  0    152
    ## 950  28        0                     0              0                  0    167
    ## 951  47        1                     0              0                  0    170
    ## 952  44        0                     1              0                  0    161
    ## 953  21        0                     1              0                  0    155
    ## 954  45        0                     1              0                  1    157
    ## 955  40        0                     1              1                  0    168
    ## 956  24        0                     0              0                  0    161
    ## 957  40        0                     1              1                  0    171
    ## 958  18        0                     0              0                  0    169
    ## 959  64        1                     1              0                  0    153
    ## 960  56        0                     1              0                  0    155
    ## 961  47        1                     1              0                  0    158
    ## 962  21        0                     0              0                  0    158
    ## 963  23        0                     0              0                  0    175
    ## 964  49        1                     0              0                  0    147
    ## 965  56        0                   132              0                  0    155
    ##     Weight KnownAllergies HistoryOfCancerInFamily NumberOfMajorSurgeries
    ## 1       57              0                       0                      0
    ## 2       73              0                       0                      0
    ## 3       59              0                       0                      1
    ## 4       93              0                       0                      2
    ## 5       88              0                       0                      1
    ## 6       69              1                       0                      1
    ## 7       74              1                       0                      0
    ## 8       93              0                       0                      0
    ## 9       74              0                       0                      2
    ## 10      67              0                       0                      0
    ## 11      57              1                       0                      1
    ## 12      97              0                       0                      0
    ## 13      76              0                       0                      1
    ## 14      68              1                       0                      1
    ## 15      67              0                       0                      0
    ## 16      82              0                       0                      0
    ## 17      97              0                       0                      0
    ## 18      97              0                       0                      2
    ## 19      81              0                       0                      0
    ## 20      92              0                       0                      1
    ## 21      83              0                       0                      1
    ## 22      97              0                       1                      1
    ## 23      57              0                       0                      0
    ## 24      97              0                       0                      0
    ## 25      88              0                       0                      2
    ## 26      73              1                       0                      0
    ## 27      58              0                       0                      0
    ## 28      96              1                       0                      1
    ## 29      68              0                       0                      0
    ## 30      88              0                       0                      0
    ## 31      85              0                       0                      3
    ## 32      79              0                       0                      2
    ## 33      55              0                       0                      0
    ## 34      61              0                       0                      1
    ## 35      81              0                       1                      1
    ## 36      91              1                       0                      0
    ## 37      68              0                       0                      0
    ## 38      96              0                       0                      2
    ## 39      55              0                       1                      1
    ## 40      82              1                       0                      1
    ## 41      57              0                       0                      0
    ## 42      78              1                       0                      1
    ## 43      69              0                       0                      0
    ## 44      96              0                       0                      0
    ## 45      56              0                       0                      1
    ## 46      83              0                       0                      0
    ## 47      83              0                       0                      0
    ## 48      77              0                       0                      2
    ## 49      91              0                       0                      0
    ## 50      59              0                       0                      0
    ## 51      63              0                       0                      0
    ## 52      75              1                       0                      0
    ## 53      59              0                       0                      2
    ## 54      79              0                       0                      0
    ## 55      72              0                       0                      0
    ## 56      70              0                       0                      0
    ## 57      61              0                       0                      0
    ## 58      80              0                       0                      0
    ## 59      78              0                       0                      0
    ## 60      63              0                       0                      2
    ## 61      79              0                       0                      1
    ## 62      97              0                       0                      2
    ## 63      60              0                       1                      1
    ## 64      53              0                       0                      0
    ## 65      57              0                       0                      0
    ## 66      53              0                       0                      1
    ## 67      94              0                       0                      1
    ## 68      68              0                       0                      0
    ## 69      68              0                       0                      0
    ## 70      54              0                       0                      2
    ## 71      75              0                       0                      2
    ## 72      84              0                       0                      1
    ## 73      74              1                       0                      0
    ## 74      54              1                       0                      2
    ## 75      87              0                       0                      0
    ## 76      64              0                       0                      0
    ## 77      54              0                       0                      0
    ## 78      59              0                       0                      0
    ## 79      75              0                       0                      1
    ## 80      56              0                       0                      0
    ## 81      81              1                       1                      1
    ## 82      94              0                       1                      1
    ## 83      91              0                       1                      1
    ## 84      67              1                       1                      1
    ## 85      58              0                       0                      0
    ## 86      61              1                       1                      1
    ## 87      95              0                       0                      3
    ## 88      76              1                       1                      1
    ## 89      66              0                       0                      2
    ## 90      77              0                       0                      2
    ## 91      95              1                       0                      1
    ## 92      74              0                       0                      1
    ## 93      80              0                       0                      0
    ## 94      63              0                       0                      0
    ## 95      97              0                       0                      0
    ## 96      96              0                       1                      1
    ## 97      91              0                       0                      0
    ## 98      56              1                       0                      0
    ## 99      96              0                       0                      0
    ## 100     68              0                       0                      0
    ## 101     58              0                       0                      0
    ## 102     96              1                       0                      1
    ## 103     75              1                       0                      1
    ## 104     53              0                       0                      3
    ## 105     91              1                       0                      1
    ## 106     58              0                       0                      0
    ## 107     74              1                       1                      1
    ## 108     62              0                       0                      0
    ## 109     76              1                       0                      1
    ## 110     70              0                       0                      1
    ## 111     86              0                       0                      2
    ## 112     62              1                       0                      1
    ## 113     55              0                       0                      0
    ## 114     59              1                       1                      1
    ## 115     64              0                       0                      2
    ## 116     72              0                       0                      1
    ## 117     72              0                       0                      0
    ## 118     90              0                       0                      0
    ## 119     84              0                       0                      0
    ## 120     95              1                       0                      0
    ## 121     76              0                       0                      0
    ## 122     56              1                       1                      1
    ## 123     74              1                       0                      1
    ## 124     62              0                       0                      1
    ## 125     53              0                       1                      1
    ## 126     83              0                       0                      2
    ## 127     95              0                       0                      0
    ## 128     96              0                       0                      0
    ## 129     91              1                       0                      1
    ## 130     81              0                       0                      0
    ## 131     86              0                       0                      0
    ## 132     75              0                       0                      2
    ## 133     86              0                       0                      0
    ## 134     63              0                       0                      0
    ## 135     95              1                       1                      1
    ## 136     59              0                       0                      2
    ## 137     66              0                       0                      1
    ## 138     67              0                       0                      1
    ## 139     81              0                       0                      2
    ## 140     75              0                       0                      0
    ## 141     65              0                       0                      0
    ## 142     68              0                       0                      0
    ## 143     79              0                       0                      2
    ## 144     53              0                       0                      0
    ## 145     72              0                       0                      2
    ## 146    116              0                       0                      1
    ## 147     70              1                       0                      1
    ## 148     90              0                       0                      0
    ## 149    118              1                       0                      1
    ## 150    110              0                       0                      0
    ## 151     69              0                       0                      0
    ## 152     76              0                       0                      1
    ## 153    121              0                       0                      0
    ## 154     69              0                       0                      0
    ## 155    116              0                       0                      1
    ## 156     78              1                       1                      1
    ## 157     98              0                       0                      0
    ## 158     73              0                       0                      1
    ## 159     76              0                       0                      0
    ## 160    104              0                       0                      0
    ## 161     77              0                       0                      0
    ## 162     89              0                       0                      0
    ## 163     73              0                       0                      0
    ## 164     80              0                       0                      1
    ## 165     92              0                       0                      0
    ## 166     80              0                       0                      0
    ## 167     79              0                       1                      1
    ## 168     83              0                       0                      1
    ## 169     73              0                       0                      1
    ## 170    116              0                       0                      1
    ## 171     71              1                       0                      1
    ## 172    106              1                       0                      1
    ## 173     74              0                       0                      0
    ## 174     78              1                       0                      2
    ## 175     68              1                       0                      1
    ## 176     99              0                       0                      1
    ## 177     86              1                       0                      1
    ## 178    119              0                       0                      0
    ## 179    107              0                       0                      0
    ## 180     91              0                       0                      0
    ## 181    129              1                       0                      0
    ## 182    109              0                       0                      0
    ## 183    100              0                       0                      0
    ## 184     91              0                       0                      0
    ## 185    109              0                       0                      0
    ## 186    127              0                       0                      2
    ## 187    107              1                       0                      1
    ## 188     84              0                       1                      1
    ## 189    132              0                       0                      0
    ## 190    120              0                       0                      0
    ## 191     90              0                       0                      0
    ## 192    100              0                       0                      1
    ## 193     86              0                       0                      0
    ## 194     91              1                       0                      1
    ## 195     82              0                       0                      0
    ## 196     96              1                       0                      1
    ## 197    128              0                       0                      1
    ## 198    120              1                       1                      1
    ## 199    107              1                       0                      0
    ## 200    114              0                       0                      1
    ## 201    123              0                       1                      1
    ## 202     93              0                       0                      0
    ## 203    110              1                       1                      1
    ## 204     95              0                       0                      0
    ## 205     80              1                       0                      1
    ## 206     98              0                       0                      0
    ## 207    111              0                       1                      1
    ## 208     88              0                       0                      2
    ## 209     91              0                       0                      0
    ## 210    103              0                       0                      2
    ## 211    126              0                       0                      2
    ## 212    121              1                       0                      1
    ## 213    104              0                       1                      1
    ## 214    102              0                       1                      2
    ## 215    118              0                       0                      1
    ## 216    105              0                       0                      1
    ## 217     92              0                       0                      0
    ## 218     93              1                       0                      1
    ## 219    128              0                       0                      0
    ## 220     96              1                       0                      2
    ## 221    124              0                       1                      1
    ## 222    122              0                       0                      0
    ## 223     87              1                       0                      2
    ## 224     58              1                       1                      1
    ## 225     74              0                       0                      0
    ## 226     73              0                       0                      2
    ## 227     59              1                       0                      1
    ## 228     60              1                       0                      1
    ## 229     71              1                       0                      1
    ## 230     93              0                       0                      0
    ## 231     78              0                       1                      1
    ## 232     89              0                       0                      2
    ## 233     93              0                       0                      0
    ## 234     95              1                       0                      1
    ## 235     84              1                       1                      1
    ## 236     58              0                       0                      0
    ## 237     88              0                       0                      2
    ## 238     86              1                       0                      0
    ## 239     58              0                       0                      2
    ## 240     71              0                       0                      1
    ## 241     73              0                       0                      0
    ## 242     64              0                       0                      1
    ## 243     87              0                       0                      0
    ## 244     90              0                       0                      0
    ## 245     63              1                       0                      0
    ## 246     93              1                       0                      0
    ## 247     97              0                       0                      0
    ## 248     89              1                       0                      2
    ## 249     77              1                       0                      0
    ## 250     56              0                       0                      0
    ## 251     96              0                       0                      0
    ## 252     86              0                       0                      1
    ## 253     85              0                       0                      0
    ## 254     61              0                       0                      0
    ## 255     62              0                       0                      1
    ## 256     95              0                       0                      0
    ## 257     78              0                       0                      0
    ## 258     84              0                       0                      1
    ## 259     66              0                       0                      1
    ## 260     91              0                       0                      1
    ## 261     83              0                       0                      0
    ## 262     70              0                       0                      1
    ## 263     58              0                       0                      1
    ## 264     82              0                       0                      2
    ## 265     63              0                       1                      1
    ## 266     69              1                       0                      1
    ## 267     88              0                       0                      3
    ## 268     84              1                       0                      0
    ## 269     60              1                       0                      0
    ## 270     63              0                       1                      1
    ## 271     78              1                       0                      1
    ## 272     79              0                       0                      0
    ## 273     73              0                       0                      0
    ## 274     70              0                       0                      1
    ## 275     81              0                       0                      3
    ## 276     73              0                       0                      1
    ## 277     81              0                       1                      2
    ## 278     87              1                       0                      1
    ## 279     62              1                       0                      1
    ## 280     57              0                       0                      1
    ## 281     64              0                       0                      1
    ## 282     71              0                       1                      1
    ## 283     73              1                       0                      1
    ## 284     76              0                       0                      0
    ## 285     70              0                       0                      1
    ## 286     88              0                       0                      0
    ## 287     87              0                       0                      0
    ## 288     91              0                       0                      2
    ## 289     71              0                       1                      1
    ## 290     84              0                       1                      1
    ## 291     88              0                       0                      2
    ## 292     87              1                       0                      0
    ## 293     74              0                       0                      0
    ## 294     71              0                       1                      1
    ## 295     75              1                       0                      0
    ## 296     88              1                       1                      1
    ## 297     66              0                       0                      0
    ## 298     81              0                       0                      0
    ## 299     95              1                       0                      0
    ## 300     71              0                       0                      0
    ## 301     81              0                       0                      2
    ## 302     94              0                       0                      3
    ## 303     70              0                       0                      0
    ## 304     96              0                       0                      0
    ## 305     86              1                       0                      1
    ## 306     95              0                       0                      0
    ## 307     78              0                       0                      1
    ## 308     70              0                       0                      0
    ## 309     68              0                       0                      1
    ## 310     78              0                       0                      0
    ## 311     85              0                       0                      0
    ## 312     63              0                       0                      1
    ## 313     77              0                       0                      0
    ## 314     97              0                       0                      0
    ## 315     97              0                       0                      0
    ## 316     75              0                       0                      1
    ## 317     74              1                       0                      1
    ## 318     92              0                       0                      0
    ## 319     76              1                       0                      0
    ## 320     69              1                       0                      1
    ## 321     85              0                       0                      2
    ## 322     85              1                       1                      1
    ## 323     70              1                       0                      0
    ## 324     97              0                       0                      2
    ## 325     80              0                       1                      2
    ## 326     63              0                       0                      1
    ## 327     87              0                       0                      0
    ## 328     95              0                       0                      2
    ## 329     70              1                       0                      0
    ## 330     86              0                       0                      2
    ## 331     61              1                       1                      1
    ## 332     63              1                       0                      1
    ## 333     82              0                       0                      0
    ## 334     61              1                       0                      1
    ## 335     96              1                       1                      1
    ## 336     64              0                       0                      1
    ## 337     67              0                       0                      0
    ## 338     72              0                       0                      0
    ## 339     58              1                       1                      1
    ## 340     80              0                       0                      0
    ## 341     63              1                       0                      1
    ## 342     75              0                       0                      2
    ## 343     94              0                       0                      0
    ## 344     65              0                       0                      0
    ## 345     86              1                       0                      1
    ## 346     97              0                       0                      1
    ## 347     87              0                       0                      1
    ## 348     67              0                       0                      2
    ## 349     80              0                       0                      0
    ## 350     58              0                       0                      0
    ## 351     79              0                       0                      0
    ## 352     63              0                       0                      0
    ## 353     88              1                       1                      1
    ## 354     83              0                       0                      0
    ## 355     93              0                       0                      1
    ## 356     73              0                       0                      1
    ## 357     89              0                       0                      0
    ## 358     83              1                       0                      2
    ## 359     79              0                       0                      1
    ## 360     65              0                       0                      2
    ## 361     78              0                       0                      0
    ## 362     58              0                       0                      0
    ## 363     77              0                       1                      1
    ## 364     74              0                       0                      0
    ## 365     95              1                       0                      0
    ## 366     63              0                       0                      2
    ## 367     80              0                       0                      0
    ## 368     82              0                       0                      0
    ## 369     76              0                       0                      0
    ## 370     82              0                       0                      2
    ## 371     71              0                       0                      0
    ## 372     74              0                       0                      0
    ## 373     60              0                       0                      2
    ## 374     57              0                       0                      0
    ## 375     97              0                       0                      0
    ## 376     73              0                       0                      0
    ## 377     57              0                       0                      0
    ## 378     91              0                       0                      0
    ## 379     72              0                       0                      0
    ## 380     79              1                       1                      1
    ## 381     59              1                       0                      0
    ## 382     87              0                       0                      0
    ## 383     56              0                       0                      0
    ## 384     77              0                       0                      0
    ## 385     63              0                       0                      0
    ## 386     72              0                       0                      0
    ## 387     76              0                       0                      2
    ## 388     58              0                       0                      1
    ## 389     68              0                       0                      1
    ## 390     61              0                       0                      0
    ## 391     70              0                       0                      2
    ## 392     58              0                       0                      1
    ## 393     58              0                       0                      1
    ## 394     52              0                       0                      3
    ## 395     74              0                       1                      1
    ## 396     76              1                       0                      0
    ## 397     75              0                       0                      2
    ## 398     52              0                       1                      1
    ## 399     59              0                       0                      0
    ## 400     54              0                       0                      0
    ## 401     77              0                       0                      0
    ## 402     54              0                       0                      0
    ## 403     73              0                       0                      2
    ## 404     75              0                       0                      0
    ## 405     70              0                       0                      2
    ## 406     73              0                       0                      0
    ## 407     53              0                       0                      0
    ## 408     73              0                       0                      0
    ## 409     59              0                       1                      1
    ## 410     70              0                       0                      0
    ## 411     52              0                       0                      0
    ## 412     76              0                       0                      0
    ## 413     59              0                       1                      1
    ## 414     72              0                       0                      0
    ## 415     57              0                       0                      0
    ## 416     68              0                       0                      1
    ## 417     56              0                       1                      2
    ## 418     61              0                       0                      0
    ## 419     65              0                       0                      0
    ## 420     51              0                       1                      1
    ## 421     57              0                       0                      0
    ## 422     71              1                       0                      1
    ## 423     62              0                       0                      0
    ## 424     68              0                       0                      1
    ## 425     76              0                       0                      1
    ## 426     66              0                       0                      0
    ## 427     73              1                       0                      0
    ## 428     63              1                       1                      1
    ## 429     70              0                       1                      1
    ## 430     52              1                       0                      0
    ## 431     57              0                       0                      0
    ## 432     58              0                       0                      1
    ## 433     59              0                       0                      1
    ## 434     64              0                       0                      1
    ## 435     64              1                       0                      1
    ## 436     52              0                       0                      0
    ## 437     73              0                       0                      0
    ## 438     63              0                       0                      1
    ## 439     51              1                       0                      0
    ## 440     74              0                       1                      2
    ## 441     74              0                       0                      0
    ## 442     76              0                       1                      2
    ## 443     77              1                       1                      1
    ## 444     73              1                       1                      1
    ## 445     73              1                       0                      2
    ## 446     51              1                       0                      2
    ## 447     68              0                       0                      1
    ## 448     53              0                       0                      0
    ## 449     70              1                       1                      1
    ## 450     74              1                       0                      1
    ## 451     71              0                       0                      3
    ## 452     62              0                       0                      0
    ## 453     56              0                       0                      0
    ## 454     58              0                       0                      1
    ## 455     62              0                       0                      0
    ## 456     78              0                       0                      3
    ## 457     74              1                       0                      0
    ## 458     70              0                       0                      0
    ## 459     58              0                       0                      0
    ## 460     76              1                       0                      0
    ## 461     70              0                       1                      1
    ## 462     73              1                       1                      1
    ## 463     60              0                       0                      0
    ## 464     63              0                       0                      0
    ## 465     77              0                       0                      1
    ## 466     56              0                       0                      0
    ## 467     54              0                       0                      0
    ## 468     70              0                       0                      1
    ## 469     65              1                       1                      1
    ## 470     75              0                       1                      2
    ## 471     65              0                       1                      1
    ## 472     58              0                       0                      1
    ## 473     63              0                       0                      0
    ## 474     69              0                       0                      0
    ## 475     62              0                       0                      0
    ## 476     60              1                       1                      1
    ## 477     51              0                       0                      0
    ## 478     68              1                       0                      1
    ## 479     63              0                       0                      0
    ## 480     78              0                       0                      0
    ## 481     54              0                       0                      0
    ## 482     54              0                       0                      1
    ## 483     54              0                       0                      1
    ## 484     68              0                       0                      1
    ## 485     64              0                       0                      0
    ## 486     52              0                       0                      1
    ## 487     62              0                       1                      2
    ## 488     62              0                       0                      1
    ## 489     65              1                       0                      1
    ## 490     63              0                       0                      0
    ## 491     67              0                       0                      2
    ## 492     61              0                       0                      0
    ## 493     81              0                       0                      1
    ## 494     73              0                       0                      1
    ## 495     75              0                       0                      2
    ## 496     92              0                       0                      2
    ## 497     86              0                       0                      0
    ## 498     87              0                       0                      0
    ## 499     81              0                       0                      1
    ## 500     81              0                       0                      2
    ## 501     83              1                       0                      1
    ## 502     83              0                       0                      0
    ## 503     93              0                       0                      0
    ## 504     74              0                       0                      1
    ## 505     91              0                       0                      0
    ## 506     87              0                       0                      0
    ## 507     78              0                       0                      0
    ## 508     77              1                       0                      0
    ## 509     97              1                       0                      0
    ## 510     73              0                       0                      1
    ## 511     93              0                       1                      1
    ## 512     88              0                       0                      0
    ## 513     88              0                       0                      1
    ## 514     93              1                       0                      1
    ## 515     83              1                       1                      2
    ## 516     86              0                       0                      0
    ## 517     87              0                       0                      0
    ## 518     76              0                       0                      0
    ## 519     89              0                       0                      2
    ## 520     84              0                       0                      1
    ## 521     94              1                       0                      1
    ## 522     85              0                       0                      0
    ## 523     82              0                       0                      0
    ## 524     91              0                       0                      0
    ## 525     81              1                       0                      1
    ## 526     87              1                       0                      1
    ## 527     81              0                       0                      0
    ## 528     94              0                       0                      0
    ## 529     79              0                       0                      2
    ## 530     85              0                       0                      0
    ## 531     79              0                       0                      0
    ## 532     97              0                       0                      2
    ## 533     82              0                       0                      0
    ## 534     75              0                       0                      0
    ## 535     86              0                       0                      0
    ## 536     77              0                       0                      1
    ## 537     75              0                       0                      1
    ## 538     79              0                       1                      1
    ## 539     77              0                       0                      0
    ## 540     81              0                       0                      0
    ## 541     74              0                       0                      0
    ## 542     78              0                       0                      0
    ## 543     85              0                       0                      2
    ## 544     89              0                       0                      2
    ## 545     89              1                       0                      1
    ## 546     75              0                       0                      1
    ## 547     77              1                       0                      1
    ## 548     90              0                       0                      0
    ## 549     95              1                       0                      1
    ## 550     73              0                       0                      1
    ## 551     96              0                       0                      1
    ## 552     92              0                       0                      0
    ## 553     82              1                       0                      1
    ## 554     94              0                       0                      0
    ## 555     90              0                       0                      0
    ## 556     94              0                       0                      0
    ## 557     96              1                       0                      2
    ## 558     79              1                       0                      0
    ## 559     88              0                       0                      0
    ## 560     91              0                       1                      1
    ## 561     74              0                       0                      2
    ## 562     74              0                       0                      2
    ## 563     89              0                       0                      1
    ## 564     81              0                       0                      1
    ## 565     75              1                       0                      1
    ## 566     73              0                       0                      2
    ## 567     83              0                       0                      0
    ## 568     77              0                       0                      0
    ## 569     79              0                       0                      1
    ## 570     93              0                       0                      0
    ## 571     81              0                       0                      1
    ## 572     79              0                       0                      0
    ## 573     76              1                       0                      2
    ## 574     78              0                       0                      1
    ## 575     95              0                       0                      1
    ## 576     90              0                       1                      1
    ## 577     78              0                       0                      0
    ## 578     95              0                       1                      1
    ## 579     74              0                       0                      1
    ## 580     90              0                       0                      0
    ## 581     82              0                       0                      1
    ## 582     89              0                       0                      0
    ## 583     84              0                       0                      0
    ## 584     93              0                       0                      0
    ## 585     97              0                       0                      0
    ## 586     88              0                       0                      0
    ## 587     79              0                       0                      0
    ## 588     88              1                       0                      1
    ## 589     91              1                       0                      1
    ## 590     74              1                       0                      1
    ## 591     81              0                       0                      0
    ## 592     83              1                       0                      0
    ## 593     87              0                       0                      0
    ## 594     79              0                       0                      1
    ## 595     89              0                       0                      0
    ## 596     91              0                       0                      0
    ## 597     97              0                       0                      3
    ## 598     83              1                       0                      1
    ## 599     75              0                       0                      1
    ## 600     94              0                       0                      0
    ## 601     87              1                       0                      0
    ## 602     75              0                       0                      1
    ## 603     83              0                       1                      1
    ## 604     84              1                       1                      1
    ## 605     93              1                       0                      1
    ## 606     82              0                       0                      0
    ## 607     91              1                       0                      1
    ## 608     79              0                       0                      0
    ## 609     76              0                       1                      1
    ## 610     76              0                       0                      2
    ## 611     92              0                       1                      1
    ## 612     84              0                       0                      0
    ## 613     84              1                       1                      1
    ## 614     82              0                       0                      0
    ## 615     89              1                       0                      1
    ## 616     94              0                       0                      0
    ## 617     86              0                       0                      0
    ## 618     82              1                       1                      1
    ## 619     87              0                       0                      1
    ## 620     89              0                       0                      0
    ## 621     60              0                       0                      0
    ## 622     60              0                       0                      0
    ## 623     97              0                       0                      0
    ## 624     64              0                       0                      2
    ## 625     74              1                       0                      1
    ## 626     74              0                       0                      0
    ## 627     61              1                       0                      1
    ## 628     67              1                       0                      0
    ## 629     78              0                       0                      1
    ## 630     70              0                       0                      0
    ## 631     92              0                       0                      1
    ## 632     88              0                       0                      0
    ## 633     65              1                       0                      1
    ## 634     67              0                       0                      1
    ## 635     57              0                       0                      0
    ## 636     76              1                       0                      1
    ## 637     78              0                       0                      1
    ## 638     81              0                       0                      0
    ## 639     65              0                       0                      2
    ## 640    101              1                       0                      0
    ## 641     60              1                       0                      1
    ## 642     80              1                       0                      0
    ## 643     89              0                       0                      0
    ## 644     76              0                       0                      0
    ## 645     65              0                       0                      1
    ## 646     75              0                       1                      1
    ## 647     54              1                       0                      1
    ## 648     99              0                       0                      0
    ## 649     69              0                       0                      0
    ## 650     57              0                       0                      1
    ## 651     70              0                       0                      1
    ## 652     76              0                       0                      1
    ## 653     65              1                       0                      1
    ## 654     65              0                       0                      0
    ## 655     75              0                       0                      0
    ## 656     54              1                       0                      2
    ## 657     76              0                       0                      0
    ## 658     56              0                       0                      1
    ## 659     74              1                       0                      1
    ## 660     93              0                       0                      0
    ## 661     88              0                       0                      0
    ## 662     70              0                       0                      1
    ## 663     97              0                       0                      1
    ## 664    101              0                       0                      0
    ## 665    101              0                       0                      0
    ## 666    100              0                       0                      0
    ## 667    100              0                       0                      0
    ## 668     81              0                       0                      2
    ## 669     70              0                       1                      1
    ## 670     60              0                       0                      0
    ## 671     82              1                       0                      1
    ## 672     62              0                       0                      0
    ## 673     97              1                       1                      1
    ## 674     64              1                       0                      1
    ## 675     86              0                       0                      0
    ## 676     76              0                       0                      2
    ## 677     74              1                       0                      1
    ## 678     71              0                       1                      1
    ## 679     72              0                       0                      0
    ## 680     55              0                       0                      0
    ## 681     98              1                       0                      0
    ## 682     59              0                       0                      1
    ## 683    101              0                       0                      0
    ## 684     96              1                       0                      1
    ## 685     64              0                       0                      0
    ## 686     87              0                       0                      0
    ## 687     89              1                       0                      0
    ## 688     60              1                       0                      1
    ## 689     88              0                       0                      0
    ## 690     60              0                       0                      2
    ## 691     83              1                       0                      0
    ## 692     56              0                       0                      0
    ## 693     78              0                       1                      1
    ## 694     98              1                       0                      0
    ## 695     60              0                       0                      0
    ## 696    100              0                       0                      0
    ## 697     87              0                       0                      0
    ## 698     76              0                       0                      0
    ## 699     94              1                       0                      0
    ## 700     62              0                       0                      1
    ## 701     95              1                       0                      1
    ## 702     92              0                       0                      2
    ## 703     57              0                       1                      1
    ## 704     61              0                       0                      0
    ## 705     89              0                       0                      2
    ## 706     73              0                       0                      2
    ## 707     73              0                       0                      0
    ## 708     69              0                       0                      0
    ## 709     71              0                       0                      0
    ## 710     98              0                       1                      1
    ## 711     95              0                       0                      0
    ## 712     56              0                       0                      1
    ## 713     87              0                       1                      2
    ## 714     58              0                       0                      0
    ## 715     59              0                       0                      0
    ## 716     67              0                       1                      2
    ## 717     92              0                       0                      0
    ## 718     87              0                       0                      0
    ## 719    100              0                       0                      0
    ## 720     88              0                       0                      2
    ## 721     82              0                       0                      0
    ## 722     98              0                       0                      2
    ## 723     68              0                       0                      2
    ## 724     83              0                       0                      2
    ## 725     73              0                       0                      1
    ## 726     84              1                       1                      1
    ## 727     83              0                       0                      0
    ## 728     72              0                       0                      0
    ## 729     72              0                       0                      1
    ## 730     84              0                       0                      0
    ## 731     76              1                       1                      1
    ## 732     80              0                       0                      0
    ## 733     83              0                       0                      0
    ## 734     76              0                       0                      1
    ## 735    101              0                       0                      0
    ## 736     84              1                       0                      1
    ## 737     80              0                       0                      0
    ## 738     85              1                       1                      1
    ## 739     87              0                       0                      1
    ## 740     74              0                       0                      0
    ## 741     76              0                       0                      2
    ## 742     58              0                       0                      2
    ## 743     60              1                       0                      0
    ## 744     58              0                       0                      0
    ## 745     78              0                       0                      0
    ## 746     63              0                       0                      0
    ## 747     87              0                       0                      0
    ## 748     55              0                       0                      0
    ## 749     85              0                       0                      0
    ## 750     98              0                       0                      0
    ## 751     74              0                       0                      0
    ## 752     94              0                       0                      1
    ## 753     60              0                       0                      2
    ## 754     65              0                       0                      0
    ## 755     55              0                       0                      0
    ## 756     71              0                       0                      1
    ## 757     71              0                       0                      0
    ## 758     58              0                       0                      0
    ## 759     62              0                       0                      0
    ## 760     97              0                       0                      0
    ## 761     93              0                       0                      2
    ## 762     88              0                       1                      1
    ## 763     80              0                       0                      0
    ## 764     79              1                       0                      0
    ## 765     54              0                       1                      1
    ## 766     56              1                       0                      1
    ## 767     62              0                       0                      0
    ## 768     92              1                       0                      0
    ## 769     85              1                       0                      1
    ## 770     88              0                       0                      0
    ## 771     60              0                       0                      2
    ## 772     68              0                       0                      0
    ## 773     81              0                       1                      1
    ## 774     96              0                       0                      1
    ## 775     61              0                       0                      0
    ## 776     84              0                       0                      1
    ## 777     59              0                       0                      0
    ## 778     86              1                       0                      1
    ## 779     82              0                       0                      0
    ## 780     75              1                       0                      0
    ## 781     97              0                       0                      0
    ## 782     94              0                       0                      0
    ## 783     86              1                       0                      2
    ## 784     57              1                       1                      1
    ## 785     62              0                       0                      0
    ## 786     78              0                       0                      1
    ## 787     57              0                       0                      1
    ## 788     58              0                       0                      0
    ## 789     85              1                       0                      1
    ## 790     78              0                       0                      0
    ## 791     71              1                       0                      1
    ## 792     78              0                       0                      0
    ## 793     59              1                       0                      0
    ## 794     95              0                       0                      1
    ## 795     95              1                       0                      0
    ## 796     94              0                       0                      0
    ## 797    100              0                       0                      0
    ## 798     66              0                       0                      0
    ## 799     73              1                       0                      1
    ## 800     74              1                       0                      1
    ## 801     57              0                       0                      0
    ## 802     94              0                       0                      3
    ## 803     99              0                       0                      3
    ## 804     64              0                       0                      1
    ## 805     80              0                       0                      2
    ## 806     82              0                       0                      0
    ## 807     64              0                       0                      2
    ## 808     95              0                       0                      0
    ## 809     98              0                       1                      1
    ## 810     70              0                       1                      2
    ## 811     86              0                       0                      1
    ## 812     83              0                       0                      0
    ## 813     91              1                       0                      1
    ## 814     82              0                       1                      1
    ## 815     67              0                       0                      0
    ## 816     83              0                       0                      0
    ## 817     92              0                       1                      1
    ## 818     99              0                       0                      0
    ## 819     88              0                       0                      0
    ## 820     62              0                       0                      0
    ## 821     74              0                       0                      2
    ## 822     57              0                       0                      0
    ## 823     59              0                       0                      2
    ## 824     89              0                       0                      0
    ## 825     65              0                       0                      2
    ## 826     72              0                       0                      0
    ## 827     60              0                       0                      0
    ## 828     58              0                       0                      0
    ## 829     75              0                       0                      0
    ## 830    100              0                       0                      0
    ## 831     86              1                       1                      1
    ## 832     66              0                       0                      0
    ## 833     74              1                       1                      1
    ## 834     72              0                       0                      1
    ## 835     66              0                       0                      1
    ## 836     69              0                       0                      0
    ## 837     67              0                       0                      2
    ## 838     74              0                       0                      0
    ## 839     75              0                       0                      0
    ## 840     73              0                       0                      0
    ## 841     73              0                       0                      1
    ## 842     69              0                       0                      0
    ## 843     66              0                       0                      3
    ## 844     75              0                       0                      0
    ## 845     75              0                       0                      1
    ## 846     74              0                       0                      0
    ## 847     73              1                       0                      1
    ## 848     66              1                       0                      1
    ## 849     69              0                       0                      1
    ## 850     67              0                       0                      1
    ## 851     66              0                       0                      0
    ## 852     68              0                       0                      1
    ## 853     68              1                       1                      1
    ## 854     68              0                       0                      1
    ## 855     69              0                       0                      1
    ## 856     69              0                       0                      0
    ## 857     67              0                       1                      1
    ## 858     66              0                       0                      1
    ## 859     69              0                       0                      0
    ## 860     68              0                       0                      0
    ## 861     66              1                       0                      1
    ## 862     67              0                       1                      1
    ## 863     67              0                       0                      0
    ## 864     72              0                       1                      1
    ## 865     75              1                       0                      1
    ## 866     72              0                       1                      1
    ## 867     66              0                       0                      0
    ## 868     68              0                       0                      0
    ## 869     68              0                       0                      1
    ## 870     70              1                       0                      1
    ## 871     75              0                       0                      0
    ## 872     67              0                       0                      0
    ## 873     67              1                       0                      1
    ## 874     72              0                       0                      0
    ## 875     69              1                       0                      1
    ## 876     71              0                       0                      0
    ## 877     75              0                       0                      0
    ## 878     71              0                       0                      2
    ## 879     70              0                       0                      0
    ## 880     69              0                       1                      1
    ## 881     72              0                       0                      0
    ## 882     73              0                       0                      0
    ## 883     73              1                       0                      2
    ## 884     75              0                       0                      0
    ## 885     74              0                       0                      1
    ## 886     70              0                       0                      2
    ## 887     69              0                       1                      1
    ## 888     71              0                       0                      0
    ## 889     74              0                       0                      1
    ## 890     71              1                       0                      0
    ## 891     72              0                       0                      1
    ## 892     71              1                       0                      1
    ## 893     70              0                       0                      0
    ## 894     69              0                       0                      0
    ## 895     73              0                       0                      2
    ## 896     66              0                       0                      1
    ## 897     66              0                       0                      2
    ## 898     75              0                       0                      1
    ## 899     71              1                       0                      1
    ## 900     67              1                       0                      0
    ## 901     75              0                       0                      0
    ## 902     70              0                       0                      0
    ## 903     73              0                       0                      0
    ## 904     68              0                       0                      0
    ## 905     67              0                       1                      1
    ## 906     67              0                       0                      0
    ## 907     73              0                       1                      1
    ## 908     67              0                       0                      1
    ## 909     72              0                       0                      0
    ## 910     75              1                       0                      1
    ## 911     69              0                       0                      1
    ## 912     75              1                       0                      1
    ## 913     69              0                       1                      1
    ## 914     70              0                       1                      1
    ## 915     71              0                       1                      1
    ## 916     69              1                       0                      1
    ## 917     68              0                       0                      0
    ## 918     66              0                       0                      1
    ## 919     72              0                       0                      1
    ## 920     66              0                       0                      1
    ## 921     68              0                       0                      0
    ## 922     66              0                       1                      1
    ## 923     73              0                       0                      1
    ## 924     73              0                       0                      0
    ## 925     73              1                       0                      0
    ## 926     72              0                       0                      0
    ## 927     69              0                       0                      0
    ## 928     71              0                       0                      1
    ## 929     67              0                       0                      2
    ## 930     69              1                       0                      1
    ## 931     66              0                       0                      3
    ## 932     73              0                       0                      3
    ## 933     66              0                       0                      0
    ## 934     67              0                       0                      0
    ## 935     75              0                       0                      1
    ## 936     70              0                       0                      0
    ## 937     75              0                       0                      2
    ## 938     73              0                       0                      0
    ## 939     66              0                       1                      1
    ## 940     70              1                       0                      0
    ## 941     69              0                       0                      0
    ## 942     67              0                       0                      1
    ## 943     71              1                       0                      1
    ## 944     67              1                       0                      1
    ## 945     73              0                       0                      0
    ## 946     66              0                       0                      0
    ## 947     75              0                       0                      1
    ## 948     66              0                       0                      0
    ## 949     75              1                       0                      1
    ## 950     66              0                       0                      0
    ## 951     66              0                       0                      0
    ## 952     75              0                       0                      0
    ## 953     74              0                       0                      0
    ## 954     67              0                       0                      1
    ## 955     70              0                       0                      0
    ## 956     71              0                       0                      0
    ## 957     74              0                       0                      0
    ## 958     67              0                       0                      0
    ## 959     70              0                       0                      3
    ## 960     71              0                       0                      1
    ## 961     73              1                       0                      1
    ## 962     75              1                       0                      1
    ## 963     73              0                       0                      0
    ## 964     67              0                       0                      1
    ## 965     71              0                       0                      1
    ##     PremiumPrice
    ## 1         1407.5
    ## 2         1632.7
    ## 3         1294.9
    ## 4         1576.4
    ## 5         1294.9
    ## 6         1294.9
    ## 7         1294.9
    ## 8         1294.9
    ## 9         1576.4
    ## 10        1407.5
    ## 11         844.5
    ## 12        1970.5
    ## 13         844.5
    ## 14        1294.9
    ## 15        1689.0
    ## 16        1294.9
    ## 17         844.5
    ## 18        1576.4
    ## 19         844.5
    ## 20        1801.6
    ## 21        1294.9
    ## 22        1970.5
    ## 23        1182.3
    ## 24         844.5
    ## 25        1576.4
    ## 26        1294.9
    ## 27        1182.3
    ## 28         844.5
    ## 29         844.5
    ## 30         844.5
    ## 31        1576.4
    ## 32        1576.4
    ## 33        1294.9
    ## 34        1407.5
    ## 35        1689.0
    ## 36         844.5
    ## 37         844.5
    ## 38        1576.4
    ## 39         844.5
    ## 40        1632.7
    ## 41         844.5
    ## 42        1294.9
    ## 43        1801.6
    ## 44        1970.5
    ## 45        1407.5
    ## 46         844.5
    ## 47        1294.9
    ## 48        1576.4
    ## 49        1801.6
    ## 50        1407.5
    ## 51        1294.9
    ## 52        1632.7
    ## 53        1576.4
    ## 54        1351.2
    ## 55        1294.9
    ## 56        1294.9
    ## 57        1407.5
    ## 58         844.5
    ## 59        1294.9
    ## 60        1576.4
    ## 61         844.5
    ## 62        1576.4
    ## 63         844.5
    ## 64        1294.9
    ## 65        1182.3
    ## 66         844.5
    ## 67        1689.0
    ## 68        1407.5
    ## 69        2139.4
    ## 70        1576.4
    ## 71        1576.4
    ## 72         844.5
    ## 73        1294.9
    ## 74        1576.4
    ## 75        2139.4
    ## 76        1294.9
    ## 77        1407.5
    ## 78         844.5
    ## 79        1294.9
    ## 80        1407.5
    ## 81        1407.5
    ## 82        2139.4
    ## 83         844.5
    ## 84        1745.3
    ## 85        1182.3
    ## 86        1407.5
    ## 87        1576.4
    ## 88        1745.3
    ## 89        1576.4
    ## 90        1576.4
    ## 91         844.5
    ## 92        1294.9
    ## 93        1294.9
    ## 94        1407.5
    ## 95        1294.9
    ## 96         844.5
    ## 97        2139.4
    ## 98         844.5
    ## 99         844.5
    ## 100       1294.9
    ## 101       1407.5
    ## 102       1294.9
    ## 103       1069.7
    ## 104       1576.4
    ## 105       1632.7
    ## 106       1294.9
    ## 107        844.5
    ## 108       1294.9
    ## 109       1294.9
    ## 110       1069.7
    ## 111       1576.4
    ## 112       1407.5
    ## 113       1407.5
    ## 114       1182.3
    ## 115       1576.4
    ## 116       1632.7
    ## 117       1294.9
    ## 118        844.5
    ## 119       1294.9
    ## 120       2139.4
    ## 121       1689.0
    ## 122       1745.3
    ## 123       1632.7
    ## 124        844.5
    ## 125        844.5
    ## 126       1576.4
    ## 127       1294.9
    ## 128        844.5
    ## 129       1294.9
    ## 130        844.5
    ## 131       1294.9
    ## 132       1576.4
    ## 133       1632.7
    ## 134       2139.4
    ## 135       1745.3
    ## 136       1576.4
    ## 137       1182.3
    ## 138       1182.3
    ## 139       1576.4
    ## 140       1632.7
    ## 141       1294.9
    ## 142       2139.4
    ## 143       1576.4
    ## 144       1407.5
    ## 145       1576.4
    ## 146       1970.5
    ## 147       1632.7
    ## 148       1294.9
    ## 149        844.5
    ## 150       1970.5
    ## 151       1407.5
    ## 152        844.5
    ## 153       1294.9
    ## 154       1407.5
    ## 155       1970.5
    ## 156        844.5
    ## 157       1294.9
    ## 158       1632.7
    ## 159        844.5
    ## 160       1294.9
    ## 161        844.5
    ## 162        844.5
    ## 163       1294.9
    ## 164       2139.4
    ## 165       1689.0
    ## 166       1294.9
    ## 167       1407.5
    ## 168       2139.4
    ## 169        844.5
    ## 170       1970.5
    ## 171       1294.9
    ## 172       1294.9
    ## 173       1294.9
    ## 174       1576.4
    ## 175       1294.9
    ## 176       1294.9
    ## 177       1294.9
    ## 178       1294.9
    ## 179       1294.9
    ## 180       1689.0
    ## 181        844.5
    ## 182        844.5
    ## 183       1294.9
    ## 184       1294.9
    ## 185       1970.5
    ## 186       1576.4
    ## 187       1294.9
    ## 188       1745.3
    ## 189        844.5
    ## 190       1294.9
    ## 191       1294.9
    ## 192       1970.5
    ## 193        844.5
    ## 194       1294.9
    ## 195       1294.9
    ## 196       1463.8
    ## 197       1463.8
    ## 198       2195.7
    ## 199       1970.5
    ## 200       1294.9
    ## 201        844.5
    ## 202       1294.9
    ## 203       1970.5
    ## 204       1689.0
    ## 205       1069.7
    ## 206       1351.2
    ## 207       1238.6
    ## 208       1576.4
    ## 209        844.5
    ## 210       1576.4
    ## 211       1351.2
    ## 212       2139.4
    ## 213       1463.8
    ## 214       1576.4
    ## 215       1970.5
    ## 216       1970.5
    ## 217        844.5
    ## 218       1294.9
    ## 219       1970.5
    ## 220       1576.4
    ## 221       1745.3
    ## 222        844.5
    ## 223       1576.4
    ## 224       1407.5
    ## 225       1294.9
    ## 226       1576.4
    ## 227       1182.3
    ## 228       1182.3
    ## 229        844.5
    ## 230       1294.9
    ## 231       1407.5
    ## 232       1576.4
    ## 233       1689.0
    ## 234       1970.5
    ## 235        844.5
    ## 236        844.5
    ## 237       1576.4
    ## 238       1294.9
    ## 239       1576.4
    ## 240        844.5
    ## 241       1632.7
    ## 242       1407.5
    ## 243        844.5
    ## 244        844.5
    ## 245       1407.5
    ## 246       1294.9
    ## 247       1970.5
    ## 248       1576.4
    ## 249       1294.9
    ## 250        844.5
    ## 251       1970.5
    ## 252       1294.9
    ## 253       1294.9
    ## 254        844.5
    ## 255       1407.5
    ## 256       1294.9
    ## 257        844.5
    ## 258        844.5
    ## 259       1407.5
    ## 260       1294.9
    ## 261       1689.0
    ## 262       1632.7
    ## 263       1407.5
    ## 264       1576.4
    ## 265       1689.0
    ## 266       1294.9
    ## 267       1576.4
    ## 268       1294.9
    ## 269        844.5
    ## 270       1182.3
    ## 271       1294.9
    ## 272       1632.7
    ## 273       1463.8
    ## 274       1294.9
    ## 275       1576.4
    ## 276       1970.5
    ## 277       1576.4
    ## 278       1294.9
    ## 279       1970.5
    ## 280       1407.5
    ## 281       1407.5
    ## 282       2139.4
    ## 283       1632.7
    ## 284        844.5
    ## 285       1294.9
    ## 286       1294.9
    ## 287       2139.4
    ## 288       2252.0
    ## 289       1745.3
    ## 290       1407.5
    ## 291       1576.4
    ## 292       1294.9
    ## 293        844.5
    ## 294        844.5
    ## 295        844.5
    ## 296       1745.3
    ## 297        844.5
    ## 298       1294.9
    ## 299       1970.5
    ## 300       1294.9
    ## 301       1576.4
    ## 302       1576.4
    ## 303        844.5
    ## 304       1351.2
    ## 305       1294.9
    ## 306       1294.9
    ## 307       2139.4
    ## 308       1294.9
    ## 309       1407.5
    ## 310       1632.7
    ## 311       2139.4
    ## 312       1294.9
    ## 313       1069.7
    ## 314       1294.9
    ## 315       1294.9
    ## 316        844.5
    ## 317       1463.8
    ## 318        844.5
    ## 319       1294.9
    ## 320       1294.9
    ## 321       1576.4
    ## 322       1745.3
    ## 323       1294.9
    ## 324       1576.4
    ## 325       1576.4
    ## 326       1013.4
    ## 327       1914.2
    ## 328       1576.4
    ## 329        844.5
    ## 330       1576.4
    ## 331       1407.5
    ## 332       1407.5
    ## 333       1689.0
    ## 334       1294.9
    ## 335       1970.5
    ## 336        844.5
    ## 337       1294.9
    ## 338       1689.0
    ## 339        844.5
    ## 340       1294.9
    ## 341       1407.5
    ## 342       1576.4
    ## 343       1294.9
    ## 344       1182.3
    ## 345       1294.9
    ## 346        844.5
    ## 347       1294.9
    ## 348       1576.4
    ## 349       1294.9
    ## 350       1689.0
    ## 351       1689.0
    ## 352       1407.5
    ## 353       1745.3
    ## 354       1294.9
    ## 355       1294.9
    ## 356       1689.0
    ## 357       1294.9
    ## 358       1576.4
    ## 359       1294.9
    ## 360       1576.4
    ## 361       1294.9
    ## 362       2139.4
    ## 363       1745.3
    ## 364       1632.7
    ## 365        844.5
    ## 366       1576.4
    ## 367        844.5
    ## 368       1294.9
    ## 369       1294.9
    ## 370       1576.4
    ## 371       1632.7
    ## 372       1294.9
    ## 373       1576.4
    ## 374       1689.0
    ## 375        844.5
    ## 376       1294.9
    ## 377       1407.5
    ## 378       1632.7
    ## 379       1069.7
    ## 380       1745.3
    ## 381       1407.5
    ## 382       1294.9
    ## 383       1407.5
    ## 384       1294.9
    ## 385       1294.9
    ## 386       1632.7
    ## 387       1576.4
    ## 388       1182.3
    ## 389       2139.4
    ## 390       1182.3
    ## 391       1576.4
    ## 392       1294.9
    ## 393       1182.3
    ## 394       1576.4
    ## 395       1407.5
    ## 396       1632.7
    ## 397       1576.4
    ## 398       1689.0
    ## 399       1294.9
    ## 400       1294.9
    ## 401       1294.9
    ## 402       1294.9
    ## 403       1576.4
    ## 404       1294.9
    ## 405       1576.4
    ## 406       1294.9
    ## 407       1294.9
    ## 408       1294.9
    ## 409        844.5
    ## 410       1294.9
    ## 411       1294.9
    ## 412       1294.9
    ## 413        844.5
    ## 414       1294.9
    ## 415        844.5
    ## 416        844.5
    ## 417       1576.4
    ## 418       1407.5
    ## 419        844.5
    ## 420       1407.5
    ## 421        844.5
    ## 422        844.5
    ## 423       1407.5
    ## 424       1294.9
    ## 425        844.5
    ## 426       1689.0
    ## 427       1126.0
    ## 428       1745.3
    ## 429        844.5
    ## 430       1294.9
    ## 431        844.5
    ## 432       1970.5
    ## 433       1407.5
    ## 434       1407.5
    ## 435        844.5
    ## 436       1294.9
    ## 437       1013.4
    ## 438        844.5
    ## 439        900.8
    ## 440       1576.4
    ## 441        900.8
    ## 442       1576.4
    ## 443        900.8
    ## 444       1745.3
    ## 445       1576.4
    ## 446       1576.4
    ## 447       1294.9
    ## 448        844.5
    ## 449        844.5
    ## 450        844.5
    ## 451       1576.4
    ## 452       2139.4
    ## 453        844.5
    ## 454       1407.5
    ## 455        844.5
    ## 456       1576.4
    ## 457        844.5
    ## 458       1689.0
    ## 459       1294.9
    ## 460       1294.9
    ## 461        844.5
    ## 462       1689.0
    ## 463       1294.9
    ## 464       1407.5
    ## 465       1294.9
    ## 466       1407.5
    ## 467       1407.5
    ## 468       1294.9
    ## 469        844.5
    ## 470       1576.4
    ## 471       1182.3
    ## 472       1407.5
    ## 473        844.5
    ## 474       1407.5
    ## 475       1294.9
    ## 476       1407.5
    ## 477       1407.5
    ## 478       1407.5
    ## 479       1407.5
    ## 480       1294.9
    ## 481       1407.5
    ## 482       1182.3
    ## 483       1182.3
    ## 484       1407.5
    ## 485        844.5
    ## 486       1182.3
    ## 487       1576.4
    ## 488       1294.9
    ## 489       1407.5
    ## 490       1294.9
    ## 491       1576.4
    ## 492       1407.5
    ## 493       1294.9
    ## 494       1069.7
    ## 495       1576.4
    ## 496       1576.4
    ## 497       2139.4
    ## 498       1294.9
    ## 499       1632.7
    ## 500       1576.4
    ## 501       1632.7
    ## 502       1632.7
    ## 503        844.5
    ## 504       1294.9
    ## 505        844.5
    ## 506       1632.7
    ## 507       1294.9
    ## 508       1294.9
    ## 509       2026.8
    ## 510       1632.7
    ## 511       1745.3
    ## 512        844.5
    ## 513        844.5
    ## 514       1632.7
    ## 515       1576.4
    ## 516       1294.9
    ## 517        844.5
    ## 518       1294.9
    ## 519       1576.4
    ## 520       1294.9
    ## 521       2139.4
    ## 522       1294.9
    ## 523        844.5
    ## 524       2026.8
    ## 525       1632.7
    ## 526       1294.9
    ## 527       1294.9
    ## 528       1294.9
    ## 529       1576.4
    ## 530       1069.7
    ## 531        844.5
    ## 532       1576.4
    ## 533       1632.7
    ## 534       1632.7
    ## 535       1632.7
    ## 536       1632.7
    ## 537       1632.7
    ## 538       1745.3
    ## 539       1294.9
    ## 540       1632.7
    ## 541        844.5
    ## 542       1069.7
    ## 543       1576.4
    ## 544       1576.4
    ## 545       1632.7
    ## 546       1632.7
    ## 547       1632.7
    ## 548       1463.8
    ## 549       1463.8
    ## 550        844.5
    ## 551       1914.2
    ## 552        844.5
    ## 553       1294.9
    ## 554       1294.9
    ## 555       1294.9
    ## 556       1689.0
    ## 557       1576.4
    ## 558        844.5
    ## 559       1632.7
    ## 560       1970.5
    ## 561       1576.4
    ## 562       1576.4
    ## 563       2139.4
    ## 564       1632.7
    ## 565        844.5
    ## 566       1576.4
    ## 567       1632.7
    ## 568       1294.9
    ## 569       1294.9
    ## 570       1294.9
    ## 571       1294.9
    ## 572        844.5
    ## 573       1576.4
    ## 574       1632.7
    ## 575       1294.9
    ## 576       1407.5
    ## 577       1689.0
    ## 578        844.5
    ## 579       1294.9
    ## 580       1689.0
    ## 581       1294.9
    ## 582       1689.0
    ## 583       1294.9
    ## 584       1294.9
    ## 585        844.5
    ## 586       1689.0
    ## 587       1632.7
    ## 588        844.5
    ## 589       1632.7
    ## 590       1632.7
    ## 591        844.5
    ## 592        844.5
    ## 593       1294.9
    ## 594       1632.7
    ## 595       1294.9
    ## 596       1069.7
    ## 597       1576.4
    ## 598        844.5
    ## 599       1294.9
    ## 600       1632.7
    ## 601       1632.7
    ## 602       1632.7
    ## 603        844.5
    ## 604       1745.3
    ## 605       1632.7
    ## 606       1632.7
    ## 607       1689.0
    ## 608        844.5
    ## 609       1745.3
    ## 610       1576.4
    ## 611        844.5
    ## 612       2139.4
    ## 613       1745.3
    ## 614       1294.9
    ## 615       2139.4
    ## 616       1294.9
    ## 617       1069.7
    ## 618       1745.3
    ## 619        844.5
    ## 620       1689.0
    ## 621       1294.9
    ## 622       1407.5
    ## 623       1689.0
    ## 624       1576.4
    ## 625        844.5
    ## 626       1294.9
    ## 627       1294.9
    ## 628       1689.0
    ## 629        844.5
    ## 630       1294.9
    ## 631       1294.9
    ## 632       1294.9
    ## 633       1294.9
    ## 634       1407.5
    ## 635        844.5
    ## 636       1632.7
    ## 637       1632.7
    ## 638        844.5
    ## 639       1576.4
    ## 640       1801.6
    ## 641       1407.5
    ## 642        844.5
    ## 643       1294.9
    ## 644       1294.9
    ## 645       1294.9
    ## 646       1745.3
    ## 647       1294.9
    ## 648       1970.5
    ## 649       1407.5
    ## 650       1294.9
    ## 651        844.5
    ## 652       1294.9
    ## 653       1407.5
    ## 654       1294.9
    ## 655        844.5
    ## 656       1689.0
    ## 657       1632.7
    ## 658        844.5
    ## 659       1632.7
    ## 660       1294.9
    ## 661       1294.9
    ## 662       1632.7
    ## 663       1294.9
    ## 664       1970.5
    ## 665        844.5
    ## 666       1970.5
    ## 667       1970.5
    ## 668       1576.4
    ## 669       1745.3
    ## 670       1294.9
    ## 671       1970.5
    ## 672       2139.4
    ## 673        844.5
    ## 674       1407.5
    ## 675       1294.9
    ## 676       1576.4
    ## 677       1294.9
    ## 678       1689.0
    ## 679       1632.7
    ## 680       1294.9
    ## 681        844.5
    ## 682       1407.5
    ## 683       1970.5
    ## 684       1689.0
    ## 685        844.5
    ## 686        844.5
    ## 687       1632.7
    ## 688       1407.5
    ## 689       1689.0
    ## 690       1576.4
    ## 691        844.5
    ## 692       1294.9
    ## 693       1689.0
    ## 694       1970.5
    ## 695        844.5
    ## 696       2139.4
    ## 697       1294.9
    ## 698       1294.9
    ## 699       1294.9
    ## 700       1407.5
    ## 701       1970.5
    ## 702       1576.4
    ## 703       2139.4
    ## 704       1407.5
    ## 705       1576.4
    ## 706       1576.4
    ## 707       1632.7
    ## 708       1294.9
    ## 709        844.5
    ## 710       1970.5
    ## 711       1294.9
    ## 712       1407.5
    ## 713       1576.4
    ## 714       1407.5
    ## 715        844.5
    ## 716       1576.4
    ## 717       1294.9
    ## 718       1632.7
    ## 719       1970.5
    ## 720       1576.4
    ## 721        844.5
    ## 722       1576.4
    ## 723       1576.4
    ## 724       1576.4
    ## 725       1069.7
    ## 726        844.5
    ## 727       2139.4
    ## 728        844.5
    ## 729       1632.7
    ## 730       1294.9
    ## 731        844.5
    ## 732        844.5
    ## 733        844.5
    ## 734       1294.9
    ## 735       1689.0
    ## 736        844.5
    ## 737        844.5
    ## 738       1970.5
    ## 739       1294.9
    ## 740       1294.9
    ## 741       1576.4
    ## 742       1576.4
    ## 743       1294.9
    ## 744       1407.5
    ## 745        844.5
    ## 746       1294.9
    ## 747        844.5
    ## 748        844.5
    ## 749       1294.9
    ## 750        844.5
    ## 751       1689.0
    ## 752       1632.7
    ## 753       1576.4
    ## 754       1182.3
    ## 755       1407.5
    ## 756       1689.0
    ## 757       1689.0
    ## 758       1294.9
    ## 759       1407.5
    ## 760       1970.5
    ## 761       1576.4
    ## 762       1689.0
    ## 763       1294.9
    ## 764       1294.9
    ## 765       1407.5
    ## 766       1294.9
    ## 767       1182.3
    ## 768        844.5
    ## 769       1689.0
    ## 770       1632.7
    ## 771       1576.4
    ## 772        844.5
    ## 773       1520.1
    ## 774       1970.5
    ## 775       1294.9
    ## 776       1632.7
    ## 777        844.5
    ## 778       1294.9
    ## 779       1294.9
    ## 780        844.5
    ## 781       1069.7
    ## 782       1294.9
    ## 783       1576.4
    ## 784       1745.3
    ## 785       1182.3
    ## 786        844.5
    ## 787        844.5
    ## 788       1294.9
    ## 789       2139.4
    ## 790        844.5
    ## 791       1069.7
    ## 792       1632.7
    ## 793       1182.3
    ## 794       1970.5
    ## 795        844.5
    ## 796       1294.9
    ## 797       1970.5
    ## 798       1182.3
    ## 799       1689.0
    ## 800       1294.9
    ## 801       1294.9
    ## 802       1576.4
    ## 803       1576.4
    ## 804       1407.5
    ## 805       1576.4
    ## 806        844.5
    ## 807       1576.4
    ## 808       1294.9
    ## 809       1407.5
    ## 810       1576.4
    ## 811        844.5
    ## 812       1632.7
    ## 813       1294.9
    ## 814       1745.3
    ## 815       1182.3
    ## 816       1294.9
    ## 817        844.5
    ## 818        844.5
    ## 819        844.5
    ## 820        844.5
    ## 821       1576.4
    ## 822       1294.9
    ## 823       1576.4
    ## 824       1294.9
    ## 825       1576.4
    ## 826       1689.0
    ## 827        844.5
    ## 828       1294.9
    ## 829       1294.9
    ## 830        844.5
    ## 831        844.5
    ## 832        844.5
    ## 833       1745.3
    ## 834        844.5
    ## 835       1407.5
    ## 836       1294.9
    ## 837       1576.4
    ## 838        844.5
    ## 839        844.5
    ## 840       1632.7
    ## 841       1970.5
    ## 842        844.5
    ## 843       1576.4
    ## 844       1294.9
    ## 845       1689.0
    ## 846        844.5
    ## 847       1294.9
    ## 848       1970.5
    ## 849        844.5
    ## 850       1407.5
    ## 851        844.5
    ## 852        844.5
    ## 853       1745.3
    ## 854        844.5
    ## 855       1294.9
    ## 856       1294.9
    ## 857       1407.5
    ## 858       1407.5
    ## 859        844.5
    ## 860       1294.9
    ## 861       1689.0
    ## 862       1407.5
    ## 863       1294.9
    ## 864        844.5
    ## 865       1689.0
    ## 866        844.5
    ## 867       1407.5
    ## 868       1294.9
    ## 869       1407.5
    ## 870       1294.9
    ## 871       1632.7
    ## 872       1294.9
    ## 873       1407.5
    ## 874       1294.9
    ## 875       1407.5
    ## 876        844.5
    ## 877        844.5
    ## 878       1576.4
    ## 879       1294.9
    ## 880       1407.5
    ## 881        844.5
    ## 882       1294.9
    ## 883       1576.4
    ## 884       1294.9
    ## 885       1294.9
    ## 886       1576.4
    ## 887       1407.5
    ## 888       1689.0
    ## 889        844.5
    ## 890        844.5
    ## 891       1632.7
    ## 892       1294.9
    ## 893       1294.9
    ## 894        844.5
    ## 895       1576.4
    ## 896       1407.5
    ## 897       1576.4
    ## 898       1294.9
    ## 899       1294.9
    ## 900        844.5
    ## 901       1632.7
    ## 902       2139.4
    ## 903        844.5
    ## 904       1407.5
    ## 905       1745.3
    ## 906       2195.7
    ## 907       2139.4
    ## 908       2195.7
    ## 909        844.5
    ## 910       1294.9
    ## 911       1407.5
    ## 912       2139.4
    ## 913       1407.5
    ## 914       1745.3
    ## 915       1745.3
    ## 916        844.5
    ## 917       1407.5
    ## 918       2139.4
    ## 919       1294.9
    ## 920       1689.0
    ## 921       1294.9
    ## 922       1407.5
    ## 923       1294.9
    ## 924       1632.7
    ## 925       1294.9
    ## 926        844.5
    ## 927       1407.5
    ## 928       1294.9
    ## 929       1576.4
    ## 930        844.5
    ## 931       1576.4
    ## 932       1576.4
    ## 933        844.5
    ## 934       1407.5
    ## 935        844.5
    ## 936        844.5
    ## 937       1576.4
    ## 938        844.5
    ## 939       1407.5
    ## 940       1294.9
    ## 941        844.5
    ## 942       1294.9
    ## 943       1970.5
    ## 944       1294.9
    ## 945        844.5
    ## 946       1407.5
    ## 947       1294.9
    ## 948        844.5
    ## 949       1294.9
    ## 950        844.5
    ## 951       1407.5
    ## 952       1294.9
    ## 953       2195.7
    ## 954       1407.5
    ## 955        957.1
    ## 956        844.5
    ## 957       2139.4
    ## 958        844.5
    ## 959       1576.4
    ## 960       1632.7
    ## 961       2195.7
    ## 962        844.5
    ## 963        844.5
    ## 964       1407.5
    ## 965       1632.7

\#Observe invalid values

    describe(mathdata.impute)

    ##                         vars   n    mean     sd median trimmed    mad   min
    ## Age                        1 965   41.78  13.96   42.0   41.73  17.79  18.0
    ## Diabetes                   2 965    0.42   0.49    0.0    0.40   0.00   0.0
    ## BloodPressureProblems      3 965    0.61   4.26    0.0    0.46   0.00   0.0
    ## AnyTransplants             4 965    0.05   0.23    0.0    0.00   0.00   0.0
    ## AnyChronicDiseases         5 965    0.18   0.38    0.0    0.10   0.00   0.0
    ## Height                     6 965  168.27  10.05  168.0  168.55  11.86 145.0
    ## Weight                     7 965   77.00  14.28   75.0   76.25  13.34  51.0
    ## KnownAllergies             8 965    0.22   0.41    0.0    0.15   0.00   0.0
    ## HistoryOfCancerInFamily    9 965    0.12   0.32    0.0    0.02   0.00   0.0
    ## NumberOfMajorSurgeries    10 965    0.67   0.75    1.0    0.57   1.48   0.0
    ## PremiumPrice              11 965 1369.64 351.53 1294.9 1354.91 417.35 844.5
    ##                          max  range  skew kurtosis    se
    ## Age                       66   48.0  0.02    -1.13  0.45
    ## Diabetes                   1    1.0  0.32    -1.90  0.02
    ## BloodPressureProblems    132  132.0 30.33   931.85  0.14
    ## AnyTransplants             1    1.0  3.90    13.23  0.01
    ## AnyChronicDiseases         1    1.0  1.70     0.88  0.01
    ## Height                   188   43.0 -0.19    -0.76  0.32
    ## Weight                   132   81.0  0.67     0.62  0.46
    ## KnownAllergies             1    1.0  1.37    -0.11  0.01
    ## HistoryOfCancerInFamily    1    1.0  2.38     3.66  0.01
    ## NumberOfMajorSurgeries     3    3.0  0.86     0.07  0.02
    ## PremiumPrice            2252 1407.5  0.09    -0.47 11.32

    sum(is.na(mathdata.impute))

    ## [1] 0
