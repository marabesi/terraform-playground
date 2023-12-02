# AWS infrastructure

Welcome to the AWS infrastructure playground, in here you will find code examples of a complete infrastructure using
the following services of AWS:

- ECS
- RDS
- S3

With the correct configuration in place, the code samples shared here are ready to be used on AWS.

## Overview

To start with things, this section provides a overview of the infrastructure used and how they are connected with each
other.

Before going into AWS, let´s review what the project we are using is made of and assumptions made:

- Backend: is based on nodejs
- Frontend: is based on static html files
- Database: Postgres

## AWS authentication

Before trying anything from this repository, make sure you have the AWS cli configured with the proper key and secret.

## Executing terraform

The standard method of executing terraform is through the command line with *terraform apply*, or *terraform --help*. As
for this project, the execution requires extra steps given the different components in the infrastructure. In short,
to execute the infrastructure, follow those steps:

1. Create a `terraform.tfvars` in the same folder as this README.md file, or copy the one that says `terraform.tfvars.example`
2. Edit the content of the `terraform.tfvars` file with the correct information
3. Run terraform: `terraform apply`

If you are wondering why this is required, it is due the wiring that happens between AWS and terraform and terraform and
what we want the infrastructure to look like. For example, the database requires a username and password and AWS requires
a key and a secret to authenticate the user.

## ECR

It requires a [special authentication](https://stackoverflow.com/a/35061033/2258921), for such follow the steps
(replace AWS_ACCOUNT_ID and AWS_REGION with the correct information before executing the command):

```
aws ecr get-login-password | docker login --username AWS --password-stdin AWS_ACCOUNT_ID.dkr.ecr.AWS_REGION.amazonaws.com
```