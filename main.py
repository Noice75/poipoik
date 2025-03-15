from selenium import webdriver
from selenium.webdriver.chrome.service import Service

chrome_driver_path = "/path/to/chromedriver"  # Update this path

service = Service(chrome_driver_path)
driver = webdriver.Chrome(service=service)
