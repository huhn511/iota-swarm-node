# Use an official Python runtime as a parent image
FROM ubuntu:18.04

# Set the working directory to /app
WORKDIR /iota-swarm-node

# Copy the current directory contents into the container at /app
ADD . /iota-swarm-node

# Install any needed packages
RUN apt-get update && apt-get install -y python3-pip python-setuptools python-dev python3-dev \
                       build-essential libssl-dev libffi-dev

# Install iota library
RUN pip3 install pyota && pip3 install --upgrade cryptography

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV NAME World

# Run server.py when the container launches
CMD ["python3", "server.py"]
