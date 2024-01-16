# Verwende das offizielle PostgreSQL-Image
FROM postgres:latest

# Setze Umgebungsvariablen für den Benutzernamen und das Passwort
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=postgres

# Expose den Standard-Port für PostgreSQL
EXPOSE 5432
