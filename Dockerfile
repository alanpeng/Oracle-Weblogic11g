FROM oraclelinux:6.8

MAINTAINER Alan Peng <peng.alan@gmail.com>

USER root

# Download Oracle JDK6 jdk-6u45-linux-x64.bin and WebLogic11g version 10.3.6
COPY download_oracle_software.sh /download_oracle_software.sh
RUN /download_oracle_software.sh && rm /download_oracle_software.sh

# Setup JDK6
RUN mkdir /root/jdk

RUN chmod +x jdk-6u45-linux-x64.bin

RUN ./jdk-6u45-linux-x64.bin && \
    rm jdk-6u45-linux-x64.bin && \
    mv jdk1.6.0_45 /root/jdk

# Setup Weblogic 1036
#Add silence mode script
COPY wls-silent.xml /wls-silent.xml

RUN /root/jdk/jdk1.6.0_45/bin/java -jar wls1036_generic.jar -mode=silent -silent_xml=/wls-silent.xml && \ 
	rm /wls1036_generic.jar /wls-silent.xml 

ENV PATH $PATH:/root/jdk/jdk1.6.0_45/bin:/root/Oracle/Middleware/oracle_common/common/bin

CMD ["bash"]
