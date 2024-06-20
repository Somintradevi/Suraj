# Use an official Code Server image as the base
FROM codercom/code-server:latest

# Install necessary packages
USER root
RUN apt-get update && apt-get install -y \
    vim \
    git \
    curl

# Allow code-server to use sudo without a password
RUN echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

# Expose the port Code Server runs on
EXPOSE 8080

# Start Code Server without authentication
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]
