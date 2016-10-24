FROM oraclelinux:6.8

MAINTAINER Alan Peng <peng.alan@gmail.com>

USER root

# Download Oracle JDK6 jdk-6u45-linux-x64.bin and WebLogic11g version 10.3.6
ADD download_jdk6.sh /
ADD download_weblogic1036.sh /
ADD wls-silent.xml /

RUN chmod +x /*.sh && \
    /download_jdk6.sh && \
    /download_weblogic1036.sh && \
    rm /download_jdk6.sh /download_weblogic1036.sh && \
    mkdir /root/jdk && \
    chmod +x jdk-6u45-linux-x64.bin && \
    ./jdk-6u45-linux-x64.bin && \
    rm jdk-6u45-linux-x64.bin && \
    mv jdk1.6.0_45 /root/jdk && \
    /root/jdk/jdk1.6.0_45/bin/java -jar wls1036_generic.jar -mode=silent -silent_xml=/wls-silent.xml && \ 
    rm /wls1036_generic.jar /wls-silent.xml 

ENV PATH $PATH:/root/jdk/jdk1.6.0_45/bin:/root/Oracle/Middleware/oracle_common/common/bin

CMD ["bash"]
