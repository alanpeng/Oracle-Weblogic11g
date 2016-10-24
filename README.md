# Oracle-Weblogic11g-Docker
Oracle Weblogic11g version 1036 Dockerfile (with base_domain initiation)

To build your docker image, please modify the username and password of the Oracle website with your own.

Please update 2 lines as below in the file "download_jdk6.sh" and "download_weblogic1036.sh"

v_oracle_website_user=peng.alan@gmail.com

v_oracle_website_password=Docker88

You can try Weblogic 11g by executing the command as below:

docker run -d -name myweblogic11g -e base_domain_default_password=123456 alanpeng/oracle-weblogic11g:1036

docker logs -f myweblogic11g

If everything goes well, then access the admin console by http://yourserver-ip:7001. 

Username: weblogic

Password: 123456
