# circleci-test
Test list variables in CircleCI with Terraform

## testing locally without CircleCI
* replace the Terraform state S3 bucket fields in the command below as appropriate
* enter details appropriate to your organization and save
* alternatively enter Terraform variables within your CI/CD pipeline

```
terraform init -backend-config=bucket=TERRAFORM_STATE_BUCKET -backend-config=key=TERRAFORM_STATE_KEY -backend-config=region=TERRAFORM_STATE_REGION
terraform plan -var='vpc_names=["cats","dogs"]'
terraform apply
```
## testing with CircleCI

* enter environment variables in CircleCI project settings:

| ENVIRONMENT VARIABLE            | EXAMPLE VALUE / COMMENT                      |
| ------------------------------- | ---------------------------------------------|
| AWS_ACCESS_KEY_ID               | -
| AWS_SECRET_ACCESS_KEY           | -                                            |
| TERRAFORM_STATE_BUCKET          | tfstate48903                                 |
| TERRAFORM_STATE_KEY             | circelci-test                                |
| TERRAFORM_STATE_REGION          | us-east-1                                    |  
| TF_VAR_vpc_names                | ["cats","dogs"]                              |

* to validate an updated CircleCI configuration:
```
docker run -v `pwd`:/whatever circleci/circleci-cli circleci config validate /whatever/.circleci/config.yml
```
