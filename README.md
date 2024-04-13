# MANOVA_R
Statistical Analysis of Heart Dataset
This repository contains R code for performing statistical analysis on a heart dataset. The dataset includes information about cholesterol levels (chol), maximum heart rate achieved (thalach), and chest pain type (cp) among patients.

Required R packages: tidyverse, rstatix, mvnormtest, heplots, car
Install required packages using the following commands in R: install.packages(c("tidyverse", "rstatix", "mvnormtest", "heplots", "car"))

Bu depo, bir kalp veri seti üzerinde istatistiksel analiz gerçekleştirmek için R kodlarını içermektedir. Veri seti, hastalar arasında kolesterol seviyeleri (chol), maksimum kalp atış hızı (thalach) ve göğüs ağrısı tipi (cp) hakkında bilgiler içermektedir.

Gerekli R paketleri: tidyverse, rstatix, mvnormtest, heplots, car
Aşağıdaki komutları kullanarak gerekli paketleri R içinde yükleyin: install.packages(c("tidyverse", "rstatix", "mvnormtest", "heplots", "car"))

Veri Seti Okuma ve Gözlemleme: İlk olarak, kod veri setini okur ve içeriğini incelemek için View fonksiyonuyla veri setini görselleştirir. Bu adım, veri setinin yapısını anlamak ve içindeki değişkenler hakkında bir fikir edinmek için yapılır.


Normal Dağılım Testleri: mshapiro_test fonksiyonu kullanılarak değişkenlerin normal dağılıma sahip olup olmadığı Shapiro-Wilk testi ile kontrol edilir. Bu test, chol ve thalach değişkenleri için gruplara göre ayrı ayrı yapılır.

Aykırı Değerleri Tanımlama ve Temizleme: identify_outliers fonksiyonu kullanılarak aykırı değerler tanımlanır ve ardından bu aykırı değerler filtrelenerek veri setinden çıkarılır.

Çok Değişkenli Varyans Homojenliği Testleri: bartlettTests, leveneTests, ve leveneTest fonksiyonları kullanılarak gruplar arasındaki varyans homojenliği test edilir. Bu testler, chol ve thalach değişkenlerinin gruplara göre varyanslarının benzer olup olmadığını değerlendirir.

Kovaryans Matrislerinin Homojenliği Testi: box_m fonksiyonu kullanılarak gruplar arasındaki kovaryans matrislerinin homojen olup olmadığı test edilir. Bu test, grupların kovaryans yapılarının benzer olup olmadığını değerlendirir.

Çok Değişkenli Varyans Analizi (MANOVA): manova ve Manova fonksiyonları kullanılarak gruplar arasında çok değişkenli varyans analizi yapılır. Bu analiz, grupların chol ve thalach değişkenlerine göre istatistiksel olarak anlamlı bir farklılık gösterip göstermediğini değerlendirir.

Post Hoc Testleri: welch_anova_test, tukey_hsd, ve games_howell_test fonksiyonları kullanılarak gruplar arasında istatistiksel olarak anlamlı farklar olup olmadığına dair post hoc testler yapılır. Bu testler, gruplar arasındaki spesifik farklılıkları belirlemeye yöneliktir.
