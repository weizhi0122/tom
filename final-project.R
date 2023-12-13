library(readr)
CANCER <- read_csv("https://raw.githubusercontent.com/LIAOMINSHIU/112-1-final-project-1/main/File_22018.csv")
dplyr::glimpse(CANCER)
#rename
library(dplyr)
CANCER |>
  rename(
    年齡標準化發生率 =年齡標準化發生率  WHO 2000世界標準人口 (每10萬人口)
  ) 
)
#paring----
##癌症別 46種----
class(CANCER$癌症別)
factor (CANCER$癌症別)
CANCER$癌症別<-factor(CANCER$癌症別)
class(CANCER$癌症別)
fct_CancerType<-factor(CANCER$癌症別)
levels(fct_CancerType)
unique_CancerType <- unique(CANCER$癌症別)
unique_CancerType

##癌症診斷年_1979----
class(CANCER$癌症診斷年)
factor (CANCER$癌症診斷年)
CANCER$癌症診斷年<-factor(CANCER$癌症診斷年)
class(CANCER$癌症診斷年)
fct_CancerTime<-factor(CANCER$癌症診斷年)
levels(fct_CancerTime)

##區域（縣市別）----
class(CANCER$縣市別)
factor (CANCER$縣市別)
CANCER$縣市別<-factor(CANCER$縣市別)
class(CANCER$縣市別)
fct_CancerCity<-factor(CANCER$縣市別)
levels(fct_CancerCity)
unique_CancerType <- unique(CANCER$縣市別)
unique_CancerType

##性別----
class(CANCER$性別)
factor (CANCER$性別)
CANCER$性別<-factor(CANCER$性別)
class(CANCER$性別)
fct_CancerGender<-factor(CANCER$性別)
levels(fct_CancerGender)

#癌症發生數----

##自1979-2020年以來哪一個癌症發生次數最高----
CANCER |>
  dplyr::group_by(
    癌症別,
  )|>
  dplyr::summarise(
    癌症平均發生數 = mean(癌症發生數)
  )|>View()

##歷年各種癌症別癌症發生數變化----
CANCER |>
  dplyr::group_by(
    癌症診斷年,
    性別,
  )|>
  dplyr::summarise(
    癌症平均發生數 = mean(癌症發生數)
  )|>View()


#各種癌症別發生的平均年齡、中位數與標準差----
##平均年齡----
CANCER |>
  dplyr::group_by(
    癌症別
  )|>
  dplyr::summarise(
    癌症平均年齡 = mean(平均年齡)
  )->cancer_type_average_age
View(cancer_type_average_age)

##平均年齡中位數----
CANCER |>
  dplyr::group_by(
    癌症別,
  )|>
  dplyr::summarise(
    癌症平均年齡中位數 = mean(年齡中位數)
  )->cancer_type_median_age
View(cancer_type_median_age)

##平均年齡標準----
CANCER |>
  dplyr::group_by(
    癌症別,
  )|>
  dplyr::summarise(
    癌症平均年齡標準化發生率= mean('年齡標準化發生率  WHO 2000世界標準人口 (每10萬人口)')
  )->cancer_type_standard_age
View(cancer_type_standard_age)

##平均年齡、中位數與標準差綜合分析----
## 假設你有一個名為cancer_data的資料框（data frame），包含所需的數據
## 列名可能類似 "CancerType", "AgeStandardizedRate", "MedianAge", "MeanAge"

## 安裝並載入必要的套件
install.packages("tidyverse")
library(tidyverse)

##資料處理和分析
CANCER %>%
  group_by(CancerType) %>%
  summarise(
    AvgAge = mean(MeanAge, na.rm = TRUE),
    MedianAge = median(MedianAge, na.rm = TRUE),
    AgeStandardizedRate = mean(AgeStandardizedRate, na.rm = TRUE)
  ) %>%
  print()
CANCER %>%
  group_by(癌症別) %>%
  summarise(
    平均年齡 = mean(平均年齡, na.rm = TRUE),
    年齡中位數 = median(年齡中位數, na.rm = TRUE),
    年齡標準化發生率  WHO 2000世界標準人口 (每10萬人口) = mean(`年齡標準化發生率  WHO 2000世界標準人口 (每10萬人口)`, na.rm = TRUE)
  ) %>%
  print()

#性別與各種癌症別癌症發生數變化----



