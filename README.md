# Social Something App Packer Build 🤗
 
This is a packer build for [Sam's Social Something App](https://github.com/sam-meech-ward-bcit/social_something_full). 

An AMI is setup in the specified region. The AMI will have NodeJS, MySQL, and CloudWatch services started & enabled. 
 
## Requirements
- [Packer](https://www.packer.io/downloads)
- [AWS CLI](https://aws.amazon.com/cli/)
 
## Setup 
1. Create root folder
2. Download as .zip file from https://github.com/sam-meech-ward-bcit/social_something_full
3. cd to root folder and clone this repo
4. ``` cd social-something-final-packer ```

## Usage
Build with ``` packer build app.pkr.hcl ```
- Default region is us-west-2
- Default log group name is social-something-loggers

To use another region, add -var option to packer build command

Example: ``` packer build -var "region=us-east-1" -var "log_group_name=social-smt-logs" app.pkr.hcl  ```
