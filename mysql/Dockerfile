FROM mysql

ENV MYSQL_DATABASE=customerdatabase
ENV MYSQL_ROOT_PASSWORD=my-secret-pw

ADD database.sql /docker-entrypoint-initdb.d/

#RUN chown -R mysql:mysql /docker-entrypoint-initdb.d
