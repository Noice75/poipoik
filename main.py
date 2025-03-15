from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options

# Setup Chrome options for headless mode (important for Railway)
chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# Specify the correct path to chromedriver
chrome_driver_path = "/usr/local/bin/chromedriver"
service = Service(chrome_driver_path)

# Start Chrome WebDriver
driver = webdriver.Chrome(service=service, options=chrome_options)

# Test ChromeDriver
driver.get("https://www.google.com")
print(driver.title)
driver.quit()
