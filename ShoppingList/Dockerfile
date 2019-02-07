FROM boyankov/swift:swift-4.2-ubuntu-16.04
LABEL Description="Shopping list, a sample app in swift."

# Get extra dependencies for Perfect
RUN apt-get update && apt-get install -y \
openssl \
libssl-dev \
uuid-dev \
libmongoc-dev \
libbson-dev \
iputils-ping \
tree

# Expose default port for App Engine
EXPOSE 8080

# Copy sources
WORKDIR /root/ShoppingList/Sources
COPY Sources/ .

WORKDIR /root/ShoppingList
COPY Package.swift .

# Release build
# RUN swift build -c release -Xswiftc -static-stdlib
RUN swift build

# Run the app
USER root
CMD ["swift", "run"]
