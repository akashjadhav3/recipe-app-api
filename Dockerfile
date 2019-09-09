FROM python:3.7-alpine
MAINTAINER Akash Jadhav
ENV PYTHONUNBUFFERED 1

# copy local path content to the  docker file contents
COPY ./requirement.txt /requirement.txt
RUN pip install -r /requirement.txt

#create empty folder in Docker Image
RUN mkdir /app

# switch to default directory and any application run this location
WORKDIR /app

# copy to local App folder to Docker App folder
COPY ./app /app

# This is for security perpose. That using appn not run as root account , attacker not access
RUN adduser -D user #user create -D used for create user for run project only not access root files and commands
USER user