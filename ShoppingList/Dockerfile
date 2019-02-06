FROM ibmcom/swift-ubuntu:latest
LABEL Description="Shopping list, a sample app in swift."

# Get extra dependencies for Perfect
RUN apt-get update && apt-get install -y \
openssl \
libssl-dev \
uuid-dev

# Expose default port for App Engine
EXPOSE 8080

# Copy sources
WORKDIR /root/ShoppingList/Sources
COPY /Sources/* / 

# Copy tests
WORKDIR /root/ShoppingList/Tests
COPY /Tests/* /

WORKDIR /root/ShoppingList
COPY Package.swift .


# Build the app
RUN swift build

# Run the app
USER root
CMD ["/root/ShoppingList/.build_lin/debug/ShoppingList"]
