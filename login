import unittest
import time
from selenium import webdriver 
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager

class TestRegister(unittest.TestCase): 

    def setUp(self): 
        self.browser = webdriver.Chrome(ChromeDriverManager().install())
        
    def test_a_success_login(self): 
        # steps
        browser = self.browser #buka web browser
        browser.get("https://opensource-demo.orangehrmlive.com/") # buka situs
        time.sleep(3)
        browser.find_element(By.ID,"txtUsername").send_keys("Admin") # isi nama
        time.sleep(1)
        browser.find_element(By.ID,"txtPassword").send_keys("admin123") # isi email
        time.sleep(1)
        browser.find_element(By.ID,"btnLogin").click() # klik button sign up
        time.sleep(3)

        # validasi
        response_data = browser.find_element(By.ID,"welcome").text

        self.assertIn('Welcome', response_data)

    def test_b_failed_login_invalid_credential(self): 
        # steps
        browser = self.browser #buka web browser
        browser.get("https://opensource-demo.orangehrmlive.com/") # buka situs
        time.sleep(3)
        browser.find_element(By.ID,"txtUsername").send_keys("A") # isi nama
        time.sleep(1)
        browser.find_element(By.ID,"txtPassword").send_keys("admin123") # isi email
        time.sleep(1)
        browser.find_element(By.ID,"btnLogin").click() # klik button sign up
        time.sleep(3)

        # validasi
        response_data = browser.find_element(By.XPATH, '/html/body/div[1]/div/div[3]/div[2]/div[2]/form/div[5]/span').text

        self.assertIn('Invalid credentials', response_data)

    def test_c_failed_login_username_empty(self): 
        # steps
        browser = self.browser #buka web browser
        browser.get("https://opensource-demo.orangehrmlive.com/") # buka situs
        time.sleep(3)
        browser.find_element(By.ID,"txtUsername").send_keys("") # isi nama
        time.sleep(1)
        browser.find_element(By.ID,"txtPassword").send_keys("admin123") # isi email
        time.sleep(1)
        browser.find_element(By.ID,"btnLogin").click() # klik button sign up
        time.sleep(3)

        # validasi
        response_data = browser.find_element(By.XPATH, '/html/body/div[1]/div/div[3]/div[2]/div[2]/form/div[5]/span').text

        self.assertIn('Username cannot be empty', response_data)

    def test_d_failed_login_password_empty(self): 
        # steps
        browser = self.browser #buka web browser
        browser.get("https://opensource-demo.orangehrmlive.com/") # buka situs
        time.sleep(3)
        browser.find_element(By.ID,"txtUsername").send_keys("Admin") # isi nama
        time.sleep(1)
        browser.find_element(By.ID,"txtPassword").send_keys("") # isi email
        time.sleep(1)
        browser.find_element(By.ID,"btnLogin").click() # klik button sign up
        time.sleep(3)

        # validasi
        response_data = browser.find_element(By.XPATH, '/html/body/div[1]/div/div[3]/div[2]/div[2]/form/div[5]/span').text

        self.assertIn('Password cannot be empty', response_data)

if __name__ == "__main__": 
    unittest.main()
