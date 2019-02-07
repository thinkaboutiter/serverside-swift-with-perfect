FROM mongo:4-xenial

EXPOSE 27017

# Get extra dependencies 
RUN apt-get update && apt-get install -y \
iputils-ping \
tree
