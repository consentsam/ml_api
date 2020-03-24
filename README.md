[![CircleCI](https://circleci.com/gh/consentsam/ml_api.svg?style=svg)](https://circleci.com/gh/consentsam/ml_api)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

### Project Files

Description of the files:

1. README.md - Instructions to build and run the project
1. .gitignore - It specifies intentionally untracked files that Git should ignore
1. config.yml - Configuration file Used by Circleci identify how you want your testing environment set up and what tests you want to run.
1. requirements.txt - File that keeps tracks of all the required libraries/packages that needs to be installed in order to run the project
1. Makefile - This file is used to define a set of tasks to be executed.It is used to setup virtual environment, linting, installing dependencies/libraries,et al.
1. Dockerfile - A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image.
1. upload_docker.sh - A shell script which consits of a set of commands which helps in uploading the docker
1. run_docker.sh - A shell script which consits of a set of commands which helps in generation of the docker container
1. run_kubernetes.sh - A shell script which consits of a set of commands which helps in downloading of the container from docker hub and deploy it into a kubernetes environment
1. Files in the `model_data` contains a pre-trained machine learning model
1. output_txt_files consits of some of the terminal output meanwhile the process of running
    1.1. docker_out.txt - Terminal Output after deploying the docker
    1.2. kubernetes_out.txt - Terminal output after kubernetes integration
1. app.py - A Flask application written in python which acts as a ML API.
1. make_prediction.sh - This shell script is responsible for sending some input data to your containerized application via the appropriate port. Each numerical value in here represents some feature that is important for determining the price of a house in Boston.

---

## Setup the Environment

#### Version control with Git
1. These instructions also assume you have `git` installed for working with Github from a terminal window, but if you do not, you can download that first from this [Github installation page](https://www.atlassian.com/git/tutorials/install-git).
1. Clone the repository as follows from the command-prompt and navigate to the directory `ml_api`

```
git clone https://github.com/consentsam/ml_api.git
cd ml_api
```

#### Generating Docker Container
1. Install docker for your operating system from the following link
    1.1. [For Windows and Mac](https://www.docker.com/products/docker-desktop)
    1.2. [For Linux based Operating System](https://docs.docker.com/install/)

1. Run the docker shell listed in the directory `ml_api` as follows:
```shell script
./run_docker.sh
```

* An image with the name housing-prices will be created based on the Dockerfile
* The ML API has been started on the and exposed on the port 8000

**Verfication of Working of API**
To make a prediction, you have to open a separate tab (while the docker is running on the main terminal) or terminal window. In this new window, navigate to the main project directory

```shell script
./make_prediction.sh
```

Running this script sends a call to the APi on the exposed port and the terminal shows the response.The response is logged in the file `docker_out.txt` inside the folder `output_text_files`

Once you are done then press `Ctrl+C` to stop the API.

### Uploading the Docker Image
1. You will need a Docker Account before proceeding further
1. You will need to store your password into the file password.txt
1. Run the following command in the terminal

```shell script
./upload_docker.sh
```
The docker has been uploaded into the Docker Hub

### Deploy with Kubernetes
1. You will need to install `minikube`,`virtualbox`,`kubectl` for your operating system.
1. Once you are done then run the below command in the terminal
```shell script
./run_kubernetes.sh
```
The above script downloads the docker image from docker hub and then get deployed to the Kubernetes cluster on port 8000.

The output of the script is saved in the file `kubernetes_out.txt` inside the folder `output_text_files`


**Verfication of Working of API**
To make a prediction, you have to open a separate tab (while the docker is running on the main terminal) or terminal window. In this new window, navigate to the main project directory

```shell script
./make_prediction.sh
```

Running this script sends a call to the APi on the exposed port and the terminal shows the response.The response is logged in the file `docker_out.txt` inside the folder `output_text_files`

Once you are done then press `Ctrl+C` to stop the API.

