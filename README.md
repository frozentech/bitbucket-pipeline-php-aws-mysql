# bitbucket-pipeline-php-aws-mysql
An inspiration from: [smartapps/bitbucket-pipelines-php-mysql](https://hub.docker.com/r/smartapps/bitbucket-pipelines-php-mysql/)
Extended from:
[frozentech/bitbucket-pipeline-php-mysql](https://hub.docker.com/r/frozentech/bitbucket-pipeline-php-mysql)

AWS](https://aws.amazon.com/cli/) [MySQL](https://www.mysql.com)
Docker image at [frozentech/bitbucket-pipeline-php-aws-mysql](https://hub.docker.com/r/frozentech/bitbucket-pipeline-php-aws-mysql/)

Built in's:
  - ENV GOOSE_DIR
  - ENV MYSQL_ROOT_PASSWORD
  - mysql-server (`/etc/init.d/mysql start`)
  - redis (`/etc/init.d/redis-server start`)
  - mysql-client (`mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE test;"`)
  - aws (`aws help`)
Sample `bitbucket-pipelines.yml`:

```YAML
image: gianebao/bitbucket-pipeline-go-aws-mysql
pipelines:
  default:
    - step:
        script:
          - /etc/init.d/mysql start
          - mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE test;"
          - aws deploy push --application-name MyGo_App --description "This is my deployment" --ignore-hidden-files --s3-location s3://CodeDeployDemoBucket/MyGoApp.zip --source /tmp/MyLocalDeploymentFolder/
```
