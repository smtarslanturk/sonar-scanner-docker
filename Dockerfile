FROM ubuntu:latest
#locale
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN apt-get update && apt-get install -y unzip wget nodejs
RUN mkdir app
WORKDIR /app
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip \
    && unzip sonar-scanner-cli-4.2.0.1873-linux.zip \
    && rm sonar-scanner-cli-4.2.0.1873-linux.zip \
    && mv sonar-scanner-4.2.0.1873-linux /opt/sonar-scanner

ENV PATH /opt/sonar-scanner/bin:${PATH}
RUN echo "${PATH}" >> /etc/bash.bashrc
#COPY /conf/sonar-scanner.properties /opt/sonar-scanner/conf/sonar-scanner.properties 
#COPY /app/ /app
COPY /conf/sonar-scanner.properties /opt/sonar-scanner/conf/sonar-scanner.properties 
COPY /app/ /app 
COPY /run.sh /app
ENTRYPOINT ["/bin/bash", "run.sh"]
