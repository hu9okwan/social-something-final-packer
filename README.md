# Social Something App Packer Build 🤗
 
This is a packer build for [Sam's Social Something App](https://github.com/sam-meech-ward-bcit/social_something_full) and is to be used in accordance with [Social Something Terraform Build](https://github.com/hu9okwan/social-something-final-terraform)

An AMI is setup in the specified region. The AMI will have NodeJS, MySQL, and CloudWatch services started & enabled. 


 
## Requirements
- [Packer](https://www.packer.io/downloads)
- [AWS CLI](https://aws.amazon.com/cli/)
 
## Setup 
1. Create root folder
2. cd to root folder
4. Clone this repo
5. Download as .zip file from https://github.com/sam-meech-ward-bcit/social_something_full and place in root folder
6. ``` cd social-something-final-packer ```

## Usage
Build with ``` packer build app.pkr.hcl ```
- Default region is us-west-2
- Default log group name is social-something-loggers

To use another region, add -var option to packer build command

Example: ``` packer build -var "region=us-east-1" -var "log_group_name=social-smt-logs" app.pkr.hcl  ```
