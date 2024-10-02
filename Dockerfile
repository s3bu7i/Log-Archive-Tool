# Step 1: Use the latest Ubuntu image
FROM ubuntu:latest

# Step 2: Install tar (used to compress logs)
RUN apt-get update && apt-get install -y tar

# Step 3: Set the working directory in the container
WORKDIR /usr/src/app

# Step 4: Copy the log-archive.sh script into the container
COPY log-archive.sh .

# Step 5: Make the script executable
RUN chmod +x log-archive.sh

# Step 6: Define the default command
# Replace "/path/to/logs" with a directory you will mount later when running the container
CMD ["/bin/bash", "./log-archive.sh", "/path/to/logs"]
