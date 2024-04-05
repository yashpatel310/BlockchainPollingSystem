FROM ubuntu:20.04

WORKDIR /app

# Copy requirements.txt separately to leverage Docker layer caching
COPY requirements.txt .

# Install Python and dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Specify the command to run your application
CMD ["python3", "app.py"]
