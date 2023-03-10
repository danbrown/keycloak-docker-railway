FROM jboss/keycloak

ARG KEYCLOAK_ADMIN
ENV KEYCLOAK_USER $KEYCLOAK_ADMIN

ARG KEYCLOAK_ADMIN_PASSWORD
ENV KEYCLOAK_PASSWORD $KEYCLOAK_ADMIN_PASSWORD

ARG KC_HOSTNAME
ENV KC_HOSTNAME $KC_HOSTNAME
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY=edge

# database setup
ARG DB_VENDOR=POSTGRES
ENV DB_VENDOR $DB_VENDOR

ARG DB_DATABASE=keycloak_db
ENV DB_DATABASE $DB_DATABASE

ARG PGHOST
ARG DB_ADDR=$PGHOST
ENV DB_ADDR $DB_ADDR

ARG PGPORT
ARG DB_PORT=$PGPORT
ENV DB_PORT $DB_PORT

ARG PGUSER
ARG DB_USER=$PGUSER
ENV DB_USER $DB_USER

ARG PGPASSWORD
ARG DB_PASSWORD=$PGPASSWORD
ENV DB_PASSWORD $DB_PASSWORD

# try to fix 
USER jboss
RUN sed -i -e 's/<web-context>auth<\/web-context>/<web-context>keycloak\/auth<\/web-context>/' $JBOSS_HOME/standalone/configuration/standalone.xml

EXPOSE 8080 9990