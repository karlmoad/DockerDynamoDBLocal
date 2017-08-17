#
# Docker file for DynamoDB Local instances for development
#
FROM openjdk:jre
MAINTAINER Karl Moad <karlmoad.github.com>
WORKDIR /var/working

# DynamoDB defualt port
EXPOSE 8000

# Get files from Amazon
RUN wget -O /tmp/dynamodb_local_latest https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz
RUN tar xfz /tmp/dynamodb_local_latest
RUN rm -f /tmp/dynamodb_local_latest

ENTRYPOINT ["/usr/bin/java","-Djava.library.path=.","-jar","DynamoDBLocal.jar","dbPath","/var/dynamo"]
CMD ["-port","8000"]

VOLUME ["/var/dynamo","/var/working"]

