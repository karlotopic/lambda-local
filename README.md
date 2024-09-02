## lambda-local

### Description

This repository is used to locally test AWS Lambda function. It can serve as a reliable way to ensure that the Lambda function will execute successfully in the AWS environment.

This flow is creating and invoking an Lambda function inside the Docker container.

### Prerequisites

1. [aws-cli](https://awscli.amazonaws.com/AWSCLIV2.msi). Automatically downloads, just install the cli tool. To check if installed correctly run: `aws --version`
2. [Docker](https://www.docker.com/products/docker-desktop/)

### Steps

1. **Spin up the local aws environment.**

   Run the `docker compose up -d` command to set up the docker container containing different aws services.

2. **Install the necessary npm packages.**

   If your Lambda function relies on npm packages (such as pg, sequelize, etc.), make sure to create a package.json file and add these packages inside the _dependencies_ section.

   Run `npm i`.

3. **Execute the run script**

   Once set up, in order to test your lambda function, one must run the batch script located in the root directory. That script is creating/updating your AWS Lambda function locally.

   If you are using a Windows machine then run the `./run.bat` command inside your terminal.

   _TBD_: Linux support.

### Executing run scripts

The scripts output will be stored inside the `output.txt`.

#### Sending data to Lambda function

To send data to a Lambda function handler method, you can include the data inside the `payload.json` file.
