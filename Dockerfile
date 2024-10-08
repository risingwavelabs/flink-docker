FROM apache/flink:1.20.0

RUN mkdir /opt/flink/plugins/s3-fs-hadoop/ && \
    cp /opt/flink/opt/flink-s3-fs-hadoop-*.jar /opt/flink/plugins/s3-fs-hadoop/ &&  \
    chown -R flink: /opt/flink/plugins/s3-fs-hadoop/

RUN wget -P /opt/flink/lib https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-kafka/3.2.0-1.19/flink-sql-connector-kafka-3.2.0-1.19.jar

RUN wget https://github.com/nexmark/nexmark/releases/latest/download/nexmark-flink.tgz &&  \
    tar -zxvf nexmark-flink.tgz && \
    mv nexmark-flink/lib/nexmark-flink-0.2-SNAPSHOT.jar /opt/flink/lib && \
    rm -rf nexmark-flink.tgz nexmark-flink

# Download csv file for nexmark q13
RUN wget -P /opt/flink https://ci-deps-dist.s3.amazonaws.com/side-input-10000.csv && \
    chown -R flink: /opt/flink/side-input-10000.csv

RUN wget -P /opt/flink https://ci-deps-dist.s3.amazonaws.com/side-input-100000.csv && \
    chown -R flink: /opt/flink/side-input-100000.csv

RUN wget -P /opt/flink https://ci-deps-dist.s3.amazonaws.com/side-input-1000000.csv && \
    chown -R flink: /opt/flink/side-input-1000000.csv

RUN wget -P /opt/flink https://ci-deps-dist.s3.amazonaws.com/side-input-10000000.csv && \
    chown -R flink: /opt/flink/side-input-10000000.csv
