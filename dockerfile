FROM tomcat

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

# let "Tomcat Native" live somewhere isolated
ENV TOMCAT_NATIVE_LIBDIR $CATALINA_HOME/native-jni-lib
ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$TOMCAT_NATIVE_LIBDIR

RUN sed -i '/<\/tomcat-users>/ i\<role rolename="manager-gui"/>' /usr/local/tomcat/conf/tomcat-users.xml
RUN sed -i '/<\/tomcat-users>/ i\<user username="tomcatm" password="b56e0b4ea4962283bee762525c2d490f" roles="manager-gui"/>' /usr/local/tomcat/conf/tomcat-users.xml
RUN sed -i '/<\/tomcat-users>/ i\<role rolename="admin-gui"/>' /usr/local/tomcat/conf/tomcat-users.xml
RUN sed -i '/<\/tomcat-users>/ i\<user username="tomcata" password="b56e0b4ea4962283bee762525c2d490f" roles="admin-gui"/>' /usr/local/tomcat/conf/tomcat-users.xml
RUN sed -i '/<\/tomcat-users>/ i\<user username="tomcatg" password="b56e0b4ea4962283bee762525c2d490f" roles="admin"/>' /usr/local/tomcat/conf/tomcat-users.xml


COPY addressbook.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
