FROM quay.io/keycloak/keycloak:20.0.3

ARG KEYCLOAK_ADMIN
ENV KEYCLOAK_ADMIN $KEYCLOAK_ADMIN

ARG KEYCLOAK_ADMIN_PASSWORD
ENV KEYCLOAK_ADMIN_PASSWORD $KEYCLOAK_ADMIN_PASSWORD

EXPOSE 8080
