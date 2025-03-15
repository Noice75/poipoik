# Use a base image with Python
FROM python:3.12-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    xvfb \
    libxi6 \
    libgconf-2-4 \
    libnss3 \
    libxrandr2 \
    libxss1 \
    libxcursor1 \
    libxcomposite1 \
    libasound2 \
    libatk1.0-0 \
    libgbm1 \
    && rm -rf /var/lib/apt/lists/*

# Install Google Chrome
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || apt-get -fy install

# Install ChromeDriver
RUN CHROME_DRIVER_VERSION=$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    wget -q https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver

# Set environment variables
ENV DISPLAY=:99

# Create and activate virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . /app
WORKDIR /app

# Start Xvfb for headless Chrome
CMD ["bash", "-c", "Xvfb :99 -screen 0 1920x1080x24 & python your_script.py"]
