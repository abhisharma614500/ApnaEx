# 1. Python का सही इमेज
FROM python:3.10-slim

# 2. वर्किंग डायरेक्टरी सेट करें
WORKDIR /app

# 3. ज़रूरी सिस्टम डिपेंडेंसीज इंस्टॉल करें
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 4. डिपेंडेंसीज की फाइल कॉपी और इंस्टॉल करें
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. सारा कोड कंटेनर में कॉपी करें
COPY . .

# 6. केवल और केवल टेलीग्राम बॉट को स्टार्ट करें
CMD ["python", "-m", "Extractor"]
