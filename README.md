# secure-aws-cli

This repository contains the code to build and run a secure, isolated environment for AWS CLI operations using Podman. The system securely manages environment variables using GPG password encryption for different AWS profiles.

## Features
- Build a Podman environment with AWS CLI and additional security tools
- Manage encrypted credentials for multiple AWS environments
- Easy switching between AWS environments

## Quick Start
Clone the repository:

```bash
git clone https://github.com/josephcmiller2/secureawscli.git
cd secureawscli
```

### Building the Podman Environment
To create the Podman environment, you need to execute the following commands:

```bash
./configure
make
```

### Running the Podman Container
Once the environment has been created, you can run the Podman container with the script:

```bash
./run.sh
```

## Usage
Scripts are located in the `/root/credentials` directory in the running container.

### Create Encrypted Credentials for an AWS Environment
To create encrypted credentials for a specific AWS environment, use:

```bash
./create_aws_env.sh ENV_NAME
```

Replace `ENV_NAME` with the name of your environment.

### Load Encrypted AWS Credentials into the Current Environment
To load the encrypted AWS credentials into the current environment, use:

```bash
source ./read_aws_env.sh
```

### Clear a Named AWS Environment from the Current Environment Variables
To clear a named AWS environment from the current environment variables, use:

```bash
source ./clear_aws_env.sh
```

## Contribution
Please feel free to contribute to this project by creating issues or submitting pull requests.

## Authors
- Joseph C Miller
