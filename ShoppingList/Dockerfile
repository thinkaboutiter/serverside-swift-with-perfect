FROM ibmcom/swift-ubuntu:latest
LABEL Description="Shopping list sample app"

# Get extra dependencies for Perfect
RUN apt-get update && apt-get install -y \
openssl \
libssl-dev \
uuid-dev

# Expose default port for App Engine
EXPOSE 8080

# Copy sources
RUN mkdir /root/ShoppingList
RUN mkdir /root/ShoppingList/Sources
ADD main.swift /root/ShoppingList/Sources
ADD Package.swift /root/ShoppingList

# Build the app
RUN cd /root/ShoppingList && swift build

# Run the app
USER root
CMD ["/root/ShoppingList/.build_lin/debug/ShoppingList"]
