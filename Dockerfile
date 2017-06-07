FROM frozentech/bitbucket-pipelines-php-mysql

RUN \
 apt-get update && apt-get -y upgrade &&\
 apt-get -y install unzip groff

RUN \
 curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" &&\
 unzip awscli-bundle.zip &&\
 ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws &&\
 rm -rfv awscli-bundle awscli-bundle.zip

RUN \
 curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest &&\
 chmod 755 /usr/local/bin/ecs-cli
