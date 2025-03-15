# Use Selenium's Standalone Chrome image
FROM selenium/standalone-chrome:latest

# Install Python & Dependencies
USER root
RUN apt-get update && apt-get install -y python3 python3-pip

# Set work directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Copy the bot script
COPY bot.py bot.py

# Expose the Selenium port
EXPOSE 4444

# Start Selenium Grid & Your Script
CMD ["sh", "-c", "nohup java -jar /opt/selenium/selenium-server.jar standalone & python3 bot.py"]
