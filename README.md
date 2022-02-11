Bu image kodlarinizi tarayabileceginiz Sonar-Scanner la alakali olusturulmustur.

Dogrudan resmi image kullanabileceginiz gibi, yapilan calismadaki imageyi de kullanabilirsiniz. 
Resmi Sonar Scanner Image: https://hub.docker.com/r/sonarsource/sonar-scanner-cli

Gereklilikler: 
- Sonar Server
- Sonar Scanner. 

Sonar scanner kurulumuyla alakali asagidaki dokumani baz alabilirsiniz: 

https://techexpert.tips/sonarqube/sonarqube-scanner-installation-ubuntu-linux/ 

Sonar Scanner kurulum yapacaginiz bilgisayara Node JS kurulu olmasi gerekmektedir. 
Ayrica ekstra olarak JAVA kurulumuna gerek yoktur. Sonar Scanner'la beraber JAVA kurulumu gelmektedir. 

Kurulum esnasinda /opt/sonar-scanner/conf/sonar-scanner.properties ve projeninizin icerisinde sonar-scanner.properties ayarlarini yapabilirsiniz ama denemelere gore o dosyalar ayarlanamasa bile terminalden run edilecek kodla gerekli configurasyonlar yapilabilir. 

Imagenin Duzgun Calismasi Icin Yapilmasi Gereken Konfigurasyonlar 
1-Yazilan imagenin aktif olmasi icin app klasoru icerisine tarama yapacaginiz projeyi atmaniz gerekmektedir. 
2-run.sh dosyasini uygun sekilde komutlar verilmeli. Ornek olarak JAVA ve JS calistirilabilecek run.sh icerikleri asagidaki gibidir. 

JAVA ICIN
sonar-scanner \
  -Dsonar.projectKey=container-java-project \
  -Dsonar.projectVersion=2.0 \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.java.binaries=. \
  -Dsonar.login=sonarservardanalinacakcredential

JS ICIN
sonar-scanner \
  -Dsonar.projectKey=container-nj-project \
  -Dsonar.sources=. \
  -Dsonar.projectVersion=1.0 \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=sonarservardanalinacakcredential

Ilgili ayarlar yapildiktan sonra:

1-Dockerfile build et: 
**docker build -t sonar-sacanner .**

2-Olusturulan docker image run et. 
**docker container run --rm --name sonar-source -it sonar-scanner**

3-Sonuclara kurmus oldugunuz SonarServerdan gorebilirsiniz. 
