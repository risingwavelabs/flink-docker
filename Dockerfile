FROM apache/flink:1.16.0

RUN mkdir /opt/flink/plugins/s3-fs-hadoop/ && \
    cp /opt/flink/opt/flink-s3-fs-hadoop-*.jar /opt/flink/plugins/s3-fs-hadoop/ &&  \
    chown -R flink: /opt/flink/plugins/s3-fs-hadoop/

RUN wget -P /opt/flink/lib https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-kafka/1.16.0/flink-sql-connector-kafka-1.16.0.jar

RUN wget https://github.com/nexmark/nexmark/releases/latest/download/nexmark-flink.tgz &&  \
    tar -zxvf nexmark-flink.tgz && \
    mv nexmark-flink/lib/nexmark-flink-0.2-SNAPSHOT.jar /opt/flink/lib && \
    rm -rf nexmark-flink.tgz nexmark-flink