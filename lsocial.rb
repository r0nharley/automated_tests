require "selenium-webdriver"

#Firefox browser instantiation
driver = Selenium::WebDriver.for :firefox
#Loading living social url
driver.navigate.to "https://www.livingsocial.com"
#driver.switch_to.frame("iframe")

driver.manage.timeouts.implicit_wait = 5 # seconds

#select Memberlogin
Memberlogin = driver.find_element(:xpath, "//ul[@id='universal-nav-my-account']/li[3]/a/span")
Memberlogin.click

#New customer/i have an account page is displayed?

puts "1. Test Passed: New Customer/Login form displayed" if
NewCust = driver.find_element(:tag_name, "body").text.include?("i'm a new customer")


#Click Signup Validation
SignupButtonValidation = driver.find_element(:xpath, "//button[@type='submit']")
SignupButtonValidation.click


#General validation messages are displayed?
puts "2. Test Passed: General form validation error messages displayed" if
General_Validation_Success_Message = driver.find_element(:tag_name, "body").text.include?("This field is required")


#Enter First Name
FirstName = driver.find_element(:xpath, "//input[@id='first_name']")
FirstName.send_keys "Ron"

#Enter Last Name
LastName = driver.find_element(:xpath, "//input[@id='last_name']")
LastName.send_keys "tester"

#Enter Invalid Email Address
InvalidEmail = driver.find_element(:xpath, "//input[@id='email']")
InvalidEmail.send_keys "Automation"

#Invalid email error validation?
puts "3. Test Passed: Invalid error validation" if
Invalid_Email_Success_Message = driver.find_element(:tag_name, "body").text.include?("Please enter a valid email address.") 


#Enter valid email
ValidEmail = driver.find_element(:xpath, "//input[@id='email']")
ValidEmail.send_keys "@test.com"


#Enter Password
Password = driver.find_element(:xpath, "//input[@id='password']")
Password.send_keys "welcome123"



#Enter InValid Password Confirmation
InvalidPasswordConfirm = driver.find_element(:xpath, "//input[@id='password_confirmation']")
InvalidPasswordConfirm.send_keys "welcome12"

#Passwords dont match validation message
puts "4. Test Passed: Password Error Validation Displayed" if
Invalid_Passord_Sucess_Message = driver.find_element(:tag_name, "body").text.include?("The passwords entered do not match")

#Enter Valid Password Confirmation
Valid_Password = driver.find_element(:xpath, "//input[@id='password_confirmation']")
Valid_Password.send_keys "3"


#Check box test

checkbox = driver.find_element(:name, "subscribe")

# Check that the checkbox exists

    element = driver.find_element(:name, "subscribe")
    element if element.displayed?

puts "5. Test Passed: The check box exists" if checkbox

# UnCheck the checkbox
checkbox.click

# Verify the state of checkbox
puts "6. Test Passed: The check box is unselected now" if checkbox.selected? == false

# Check the checkbox
checkbox.click

# Verify the state of checkbox
puts "7. Test Passed: The check box is selected now" if checkbox.selected? == true

#Click Signup
SignupButton = driver.find_element(:xpath, "//button[@type='submit']")
SignupButton.click

#Verify existing user message
puts "8. Test Passed: Existing user message displayed" if
New_Member_Success_Message = driver.find_element(:tag_name, "body").text.include?("The address Automation@test.com is already registered.")


#Quitting the browser
driver.quit







