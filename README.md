# Çok Değişkenli Varyans Analizi (MANOVA) ile Kalp Hastalığı Verisi Analizi

![HEART](https://github.com/user-attachments/assets/1c54ef5d-a387-4905-9ae7-da5e856b0c13)

Bu proje, kalp hastalığına dair verileri kullanarak çok değişkenli varyans analizi (MANOVA) gerçekleştirmeyi amaçlamaktadır. Çeşitli normallik testleri, aykırı değer tespiti, varyans homojenliği testleri ve post-hoc testler ile veri setinin analizi yapılmıştır. Ayrıca, MANOVA modelinin performansı çapraz doğrulama (cross-validation) ile test edilmiştir. Projede kullanılan veriler, göğüs ağrısı tipi (cp) ve iki sürekli değişken (kolesterol ve maksimum kalp hızı) üzerinde yoğunlaşmaktadır.

# Kullanılan Yöntemler:

- **Shapiro-Wilk Normallik Testi**
- **Aykırı Değerlerin Filtrelenmesi**
- **Bartlett ve Levene Varyans Homojenliği Testleri**
- **Box's M Testi**
- **MANOVA Modeli ve Post-Hoc Testler (Welch ANOVA, Tukey HSD, Games-Howell)**
- **Korelasyon Analizi ve Etki Büyüklüğü Hesaplaması**
- **Multikollineerlik Testi (VIF)**
- **Cross-Validation (Çapraz Doğrulama)**

# 1. Veri Yükleme ve Hazırlık
Bu kısımda heart.csv adlı veri dosyası yükleniyor ve veri seti incelenmek için View() fonksiyonu ile görüntüleniyor.

2. Normallik Testi (Shapiro-Wilk Testi)
Verinin "chol" (kolesterol) ve "thalach" (maksimum kalp hızı) değişkenlerinin normalliği cp (göğüs ağrısı tipi) gruplarına göre test ediliyor. Shapiro-Wilk Testi normallik testi yapar ve p-değeri hesaplanır. Eğer p-değeri 0.05'ten küçükse, veri normallik varsayımını sağlamaz.

3. Aykırı Değerlerin Tespiti
Bu adımda chol ve thalach değişkenlerinde aykırı değerler tespit edilmektedir.

4. Aykırı Değerlerin Filtrelenmesi
Aykırı değerler chol (kolesterol) için 394'ün üzerinde ve thalach (maksimum kalp hızı) için 71'in altında olan gözlemler çıkarılmaktadır.

5. Normallik Testi (Aykırı Değerler Sonrası)
Aykırı değerler çıkarıldıktan sonra tekrar normallik testi yapılır.

6. Çok Değişkenli Varyans Homojenliği Testleri
Bu adımda, Bartlett Testi ve Levene Testi kullanılarak değişkenlerin (chol ve thalach) gruplar arası varyanslarının homojenliği test edilir. Varyans homojenliği, MANOVA için önemli bir varsayımdır.

7. Box's M Testi: Box's M Testi, iki grup arasındaki kovaryans matrislerinin homojenliğini test eder.

8. MANOVA Modeli
MANOVA (çoklu değişkenli varyans analizi) uygulanır. Bu modelde chol ve thalach değişkenleri, cp (göğüs ağrısı tipi) bağımsız değişkenine göre incelenmektedir. summary(model) komutu ile sonuçlar görüntülenir.

9. Post-Hoc Testler
Bu adımda, MANOVA sonrasında grup karşılaştırmalarını yapabilmek için birkaç post-hoc test uygulanır:

- **a) Welch ANOVA Testi: Gruplar arasındaki farkları test ederken heterojen varyansları dikkate alır.**
- **b) Tukey HSD Testi: Her grup arasındaki tüm çift karşılaştırmalarını yaparak hangi gruplar arasında anlamlı fark olduğunu belirler.**
- **c) Games-Howell Testi: Heterojen varyanslara sahip verilerde gruplar arası farkları incelemek için kullanılır.**

10. Veri Keşif Analizi (Exploratory Data Analysis - EDA)
Boxplot ile chol (kolesterol) ve thalach (maksimum kalp hızı) dağılımları, cp (göğüs ağrısı tipi) gruplarına göre görselleştirilir.
Scatter Plot ile chol ve thalach arasındaki ilişki, farklı cp gruplarına göre görselleştirilir ve korelasyon katsayısı hesaplanır.

11. Ek Normallik Testleri
Kolmogorov-Smirnov Testi normallik için ek bir testtir ve chol ve thalach değişkenlerinin normalliği kontrol edilir.

12. Korelasyon Analizi
Chol ve Thalach değişkenleri arasındaki korelasyon matrisi hesaplanır. Korelasyon matrisi görselleştirilir.

13. Ek Post-Hoc Testler
LSD ve Bonferroni testleri ile post-hoc analizler yapılır.

14. MANOVA Modelinde Etki Büyüklüğü (Effect Size)
MANOVA modelinde etki büyüklüğü, modelin bağımsız değişkenlerinin, bağımlı değişkenler üzerindeki etkisinin büyüklüğünü ölçen bir analiz yapılır.

15. Multikollineerlik Kontrolü
VIF (Variance Inflation Factor), değişkenler arasındaki multikollineerliği kontrol eder. VIF değeri yüksekse, bağımsız değişkenler arasında yüksek korelasyon olduğu anlamına gelir.

16. Model Performansı ve Validasyon
Cross-validation (çapraz doğrulama) MANOVA modelinin doğruluğunu ve güvenilirliğini artırmak için yapılır. Bu, modelin genellenebilirliğini test etmek için kullanılan bir tekniktir. boot() fonksiyonu, veriyi tekrar örnekleyerek modelin doğruluğunu test eder.








