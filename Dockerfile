FROM quay.io/keycloak/keycloak:20.0.3

ARG KEYCLOAK_ADMIN
ENV KEYCLOAK_ADMIN $KEYCLOAK_ADMIN

ARG KEYCLOAK_ADMIN_PASSWORD
ENV KEYCLOAK_ADMIN_PASSWORD $KEYCLOAK_ADMIN_PASSWORD

ARG KC_HOSTNAME
ENV KC_HOSTNAME $KC_HOSTNAME
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_HTTP_ENABLED=true

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

RUN echo $(hostname -i)
RUN echo $(hostname -f)
RUN echo $(hostname)
RUN echo $(ifconfig)

EXPOSE 8080

CMD [ "start" ]
