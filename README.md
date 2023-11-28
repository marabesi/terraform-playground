# Terraform playground

This repository was initially a playground for the material developed during the
[udemy course on terraform](https://marabesi.com/certification/2021/08/07/terraform-hashicorp-certification.html), for
newcomers it is recommended to go through [this introduction material](https://www.goodreads.com/book/show/42589303-terraform).

Therefore, as the time evolves the content in here evolved to an example of everything that the course goes through plus
receipts for services on AWS and local infrastructure with docker.

In here you will find the following:

- [Full examples of using AWS services such as: s3, rds and ecs](./aws-infrastructure)
  - It is recommended to have previous knowledge on AWS services, for someone that has nothing to zero knowledge on that [here](https://marabesi.com/aws/ccp/1-cloud-practitioner-notes.html) is a start point
- [Examples of using terraform with docker](./docker)
  - Terraform supports docker as a backend, the examples used take advantage of that to spin up a nginx container

## Requirements for this repository

- Terraform CLI running
- Knowledge of bash script to define environment variables and run scripts

## Work that still needs to be done

- VPC
- Networking
- Security
- Backup
