# Use official updated Python 3.10 image (fixes the 404 apt-get error)
FROM python:3.10-slim

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements (if you use one)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy your code
COPY . .

# Run the Extractor module
CMD ["sh", "-c", "python -m Extractor"]
