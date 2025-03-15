from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import time

# Use Selenium Grid URL instead of a local WebDriver
SELENIUM_GRID_URL = "http://localhost:4444/wd/hub"

# Configure Selenium to connect to the Grid
options = webdriver.ChromeOptions()
driver = webdriver.Remote(command_executor=SELENIUM_GRID_URL, options=options)

# Example: Open Google and Search
driver.get("https://www.google.com")
search_box = driver.find_element(By.NAME, "q")
search_box.send_keys("Railway Selenium Hosting")
search_box.submit()

time.sleep(5)
print(driver.title)

# Close the browser
driver.quit()
