This image is about sonar-scanner by which you can scan your codes.

You can use the official image directly and also you can use the image on the work as well. Official Sonar Scanner Image:https://hub.docker.com/r/sonarsource/sonar-scanner-cli 

__Requirements:__
Sonar Server
Sonar Scanner

You can base the document about sonar scanner setup below:
https://techexpert.tips/sonarqube/sonarqube-scanner-installation-ubuntu-linux/ 

You must have Node JS have installed on the computer in which you will set up sonar scanner.
Also there is no need to set up JAVA as extra. JAVA setup comes with Sonar Scanner.

You can do  /opt/sonar-scanner/conf/sonar-scanner.properties while set up and while doing project you can fix the settings of sonar- scanner.properties.

According to the attempts that has done even if the documents (/opt/sonar-scanner/conf/sonar-scanner.properties) are not set, you can do necessary configurations with the code which is run inside the terminal.

__Configurations Required for Image to Work Correctly:__
1- Put the project you will scan into the /app folder.
2- The run.sh file should be given appropriate commands. For example, the run.sh contents that can run JAVA and JS are as follows.

__Sonar-Scanner run.sh example for JAVA project__
sonar-scanner \ 
-Dsonar.projectKey=container-java-project \
-Dsonar.projectVersion=2.0 \
-Dsonar.host.url=http://localhost:9000 \
-Dsonar.java.binaries=. \
-Dsonar.login=sonarservardanalinacakcredential

__Sonar-Scanner run.sh example for JAVA project__
sonar-scanner \ 
-Dsonar.projectKey=container-nj-project \
-Dsonar.sources=. \
-Dsonar.projectVersion=1.0 \
-Dsonar.host.url=http://localhost:9000 \
-Dsonar.login=sonarservardanalinacakcredential

__After the relevant settings are made:__
1-Build Dockerfile:
__docker build -t sonar-sacanner .__

2-Run the created docker image.
__docker container run --rm --name sonar-source -it sonar-scanner__

3-You can see the results from the SonarServer you have installed.
