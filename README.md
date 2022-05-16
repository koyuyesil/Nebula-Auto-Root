**Custom Recovery Kaynakları;**  
  
[**TWRP Official - Devices**](https://twrp.me/Devices/)  
**[PitchBlack Recovery Official Devices - PitchBlack Recovery Project](https://pitchblackrecovery.com/devices)  
[PitchBlack Recovery Project download | SourceForge.net](https://sourceforge.net/projects/pbrp/)  
[OrangeFox Recovery Downloads](https://orangefox.download/tr-TR)**  
[**SHRP - Browse Files at SourceForge.net**](https://sourceforge.net/projects/shrp/files/)  
  
**Desteklenen Modeller;**  

-   **Xiaomi Mi 8 SE (sirius)**
-   **Xiaomi Mi 9 SE (grus)**
-   **Xiaomi Mi 10 (umi)(eklenecek)**
-   **Xiaomi Mi A2 Lite (daisy)**
-   **Xiaomi Mi Note 10 / Mi CC9 Pro(tucana)** **(recoveryde ekran kilidi açın)**
-   **Xiaomi Redmi 7 (onclite)**
-   **Xiaomi Redmi 8 (olive)** **(decyription fixed aşağıda)**
-   **Xiaomi Redmi 8A (olivelite)**
-   **Xiaomi** **Redmi 9 (9 Prime India)****(lancelot)(eklenecek)**
-   **Xiaomi Redmi K20 / Mi 9T (davinci)**
-   **Xiaomi Redmi K20 Pro / Mi 9T Pro (raphael)**
-   **Xiaomi Redmi K30 / POCO X2 (phoenix)**
-   **Xiaomi Redmi K30 Pro / Zoom Edition / POCO F2 Pro (lmi)**
-   **Xiaomi Redmi Note 2 (hermes)**
-   **Xiaomi Redmi Note 5 (whyred)**
-   **Xiaomi Redmi Note 7 (lavender)** ****(decyription fixed aşağıda)****
-   **Xiaomi Redmi Note 8 (ginkgo)**
-   **Xiaomi Redmi Note 8 Pro (begonia)**
-   **Xiaomi Redmi Note 8T (willow)**
-   **Xiaomi Redmi Note 9 / 10X 4G (merlin) (eklenecek)**
-   **Xiaomi Redmi Note 9 Pro (joyeuse)** **(sideload çalışmıyor)**
-   **Xiaomi Redmi Note 9S (9 Pro India)**

**NOTLAR**  

-   EFS RESET yazan betikler cihaz EFS bölümlerini yedekleyerek siler twrp hatasından dolayı yedek alamayabilir dikkatli kullanın.
-   Genel olarak TWRP yerine PBRP veya OrangeFox kullanılmıştır.
-   İsteğe bağlı PBRP ve OrangeFox ayrıca zip olarak flaşlandığında tüm özellikleri çalışır klasörde mevcuttur.
-   Betikleri çalıştırın ve talimatlar dışında işlemi betiğe bırakın müdahale etmeyin.

**BİLİNEN HATALAR**  

-   Note 9 Pro (joyeuse) PBRP sideload açmadığından manuel olarak zip flaşlayın.
-   Note 10/10 pro (tucana) OrangeFox recovery boot ettiğinde hemen ekran kilidini açın.
-   Betikler hatalara duyarsızdır hata olduğunda işleme devam etmeye çalışacaktır ekranı takip edin.
-   Qualcomm 5G cihazlarda efs yedeği almayacaktır.  **"EFS_BACKUP_RESET_5G_QC"** bu dosya ile yedek alın.
-   Özel recovery ler data bölümünü çözmüyorsa EFS yedeği alamama ihtimali vardır. Yine de betik sayesinde yedek alınabilir.
-   Birden fazla cihaz bağlı olmamalıdır.
-   Betik çalışırken ekranında fare ile yanlışlıkla seçim yaparsanız komut yürütme duraklatılır. 1 defa ESC tuşuna basınız.
-   Saat gece 00 dan 9:59 a kadar betik düzgün çalışmıyor. String birleştirmede beklenmeyen karakter hatası var.

**KULLANIM İPUÇLARI**  

-   İşleme Başlamadan önce Usb Hata Ayıklama açık olmalıdır.
-   Betikler her çalıştırıldığında EFS Partition yedeklerini pcye zaman damgasıyla kopyalar. İlk alınan klasöre qcn yedeğini de kopyalayın.
-   Genelde ihtiyacınız olan  **"ROOT_EFS_BACKUP.BAT"**  Betiğidir. Cihazınızı Root eder ve sonunda Diagnostic Portunu açar.
-   Sadece EFS silmek istediğinizde  **"EFS_BACKUP_RESET.BAT"**  Betiğini kullanın.(4 efs bölüm yedekler 3 efs bölüm siler)
-   Sadece EFS silmek istediğinizde  **"EFS_BACKUP_RESET_4P.BAT"**  Betiğini kullanın.(4 efs bölüm yedekler 4 efs bölüm siler)
-   Alınan yedekleri geri yüklemek için cihaz dahili hafızaya kopyalayın ve  **"EFS_RESTORE.BAT"** Betiğini çalıştırınız.
-   Desteklemeyen modelleri recovery dosyasını twrp_kodadı_recovery.img olarak adlandırıp klasöre atınız.
-   **ROOT_EFS_BACKUP.bat** Betiği için Cihaz ana ekranda ve USB Hata Ayıklama açık olmalıdır.
-   **ROOT_EFS_RESET.bat** Betiği için Cihaz ana ekranda ve USB Hata Ayıklama açık olmalıdır.
-   **DIAG ENABLE*.bat** Betikleri için Cihaz Özel Kurtarma (TWRP vb.) menüsünde olmalıdır.
-   **EFS_BACKUP_RESET*.bat** Betikleri için Cihaz Özel Kurtarma (TWRP vb.) menüsünde olmalıdır.
-   **EFS_RESTORE.bat** Betiği için Cihaz Özel Kurtarma (TWRP vb.) menüsünde olmalıdır.
-   **FLASH STOCK RECOVERY.bat** Betikleri için FASTBOOT modunda olmalıdır. Bu dosyayı rom ile aynı klasörde çalıştırın.
-   **ROOT_FROM_SIDELOAD.bat** Betiği için Cihaz Özel Kurtarma (TWRP vb.) menüsünde olmalıdır.
-   ***(FB).bat** Betikleri için FASTBOOT modunda olmalıdır.
-   ***(ADB).bat** Betikleri için ADB bağlı olması yeterlidir.

**GÜNCELLEMELER**  

-   **lavender** recovery imajını bununla değiştirin aynı isim ile yeniden adlandırarak kopyalayın  
    **[https://orangefox.download/tr-TR/device/lavender](https://orangefox.download/tr-TR/device/lavender)**
-   **olive**  recovery imajını bununla değiştirin aynı isim ile yeniden adlandırarak kopyalayın  
    **[https://orangefox.download/tr-TR/device/olive](https://orangefox.download/tr-TR/device/olive)**

**LÜTFEN GERİBİLDİRİM BIRAKINIZ.**  
**YORUMA GÜNCEL VERSİYONLARDA SORUNSUZ ÇALIŞAN CUSTOM RECOVERY LİNKLERİ BIRAKINIZ.**