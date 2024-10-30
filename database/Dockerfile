FROM postgres:latest

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=admin
ENV POSTGRES_DB=book-store

COPY dump.sql /docker-entrypoint-initdb.d/

EXPOSE 5432

