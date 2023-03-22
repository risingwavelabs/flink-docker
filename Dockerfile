FROM apache/flink:1.16.0

RUN mkdir /opt/flink/plugins/s3-fs-hadoop/
RUN cp /opt/flink/opt/flink-s3-fs-hadoop-*.jar /opt/flink/plugins/s3-fs-hadoop/ && chown -R flink: /opt/flink/plugins/s3-fs-hadoop/

RUN wget -P /opt/flink/lib https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-kafka/1.16.0/flink-sql-connector-kafka-1.16.0.jar