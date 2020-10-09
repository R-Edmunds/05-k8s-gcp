# 05-k8s-gcp

Example of CI/CD pipeline deploying to the Google Cloud Platform.

`git > travis ci > gcp kubernetes engine`

## Encrypting GCP IAM credential file

Did this in ruby docker container

[https://docs.travis-ci.com/user/encrypting-files/](https://docs.travis-ci.com/user/encrypting-files/)

    1  cd /mnt
    2  ls
    3  gem install travis
    4  ruby -v
    5  travis login
    6  ls
    7  travis encrypt-file ./k8s-gcp-291816-95fd924a9f03.json
    8  travis encrypt-file -r R-Edmunds/05-k8s-gcp ./k8s-gcp-291816-95fd924a9f03.json
