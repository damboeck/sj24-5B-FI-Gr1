
# MySQL mit Scripts für die Administration

# FROM mysql:8.0.34-debian
FROM mysql:8.0.34

LABEL maintainer="werner.damboeck@htlstp.ac.at"
LABEL description="MySQL-server"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
ENV MYSQL_ROOT_PASSWORD=changeme

RUN  microdnf install dos2unix && \
     microdnf install nano


ADD ./scripts/* ./scripts/
RUN chmod 755 ./scripts/*.sh && \
    dos2unix ./scripts/*.sh && \
    echo >>/etc/my.cnf && \
    echo "[mysqld]" >>/etc/my.cnf && \
    echo "sql_mode=\"STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION\"" >>/etc/my.cnf  && \
    echo "default-time-zone='SYSTEM'" >>/etc/my.cnf && \
    echo "max_connections=500" >>/etc/my.cnf

RUN ln -s /scripts/help.sh /bin/help && \
    ln -s /scripts/import-database.sh /bin/import && \
    ln -s /scripts/export-database.sh /bin/export && \
    ln -s /scripts/create-db-user.sh  /bin/cu && \
    ln -s /scripts/create-db.sh  /bin/cdb && \
    ln -s /scripts/recreate-db.sh  /bin/rcdb && \
    ln -s /scripts/run-sql.sh  /bin/run && \
    ln -s /scripts/create-db-user_all_databases.sh  /bin/cua && \
    ln -s /scripts/init-db.sh  /bin/initialize

EXPOSE 3306
