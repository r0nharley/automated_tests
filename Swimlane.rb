require "selenium-webdriver"

#Chrome browser instantiation
driver = Selenium::WebDriver.for :chrome
#Loading Angular To do app
driver.navigate.to "http://todomvc.com/examples/angular2/"
#driver.switch_to.frame("iframe")

driver.manage.timeouts.implicit_wait = 15 # seconds
driver.manage.window.maximize

#Add the first Todo
driver.find_element(:xpath, "//input[@placeholder='What needs to be done?']").click
driver.find_element(:xpath, "//input[@placeholder='What needs to be done?']").send_keys "One"
driver.find_element(:xpath, "//input[@placeholder='What needs to be done?']").send_keys :enter

#Check if the Todo has been added
if driver.find_element(:xpath, "//input[@class='toggle']").displayed?
  puts "Test Passed:Todo Added"
else
  puts "todo failed" 
end

#Double Click on the first Todo
Edit1 = driver.find_element(:xpath, "//label[contains(.,'One')]")
driver.action.double_click(Edit1).perform

#Clear the first Todo field
driver.find_element(:xpath, "//input[@class='edit']").clear
#Edit the first Todo Field
driver.find_element(:xpath, "//input[@class='edit']").send_keys "First Edit"
driver.find_element(:xpath, "//input[@placeholder='What needs to be done?']").click

#Check if the first Todo has been edited
if driver.find_element(:xpath, "//label[contains(.,'First Edit')]").displayed?
  puts "Test Passed:Todo Edited"
end

#Check if the footer count is correct
if driver.find_element(:xpath, "//footer[contains(.,'1 item left')]").displayed?
  puts "Test Passed:Item indicator displays 1 item"
else
  puts "item indicator test Failed"
end

#Add a second Todo
driver.find_element(:xpath, "//input[@placeholder='What needs to be done?']").send_keys "Two"
driver.find_element(:xpath, "//input[@placeholder='What needs to be done?']").send_keys :enter

#Check if the second Todo is displayed
if driver.find_element(:xpath, "//label[contains(.,'Two')]").displayed?
  puts "Test Passed:Todo #2 added"
end

#Checks if the footer count is correct
if driver.find_element(:xpath, "//footer[contains(.,'2 items left')]").displayed?
  puts "Test Passed:Item indicator displays 2 item"
else
  puts "Element not present:Test Failed"
end

#Clicks the all Checkbox
driver.find_element(:xpath, "//input[@class='toggle-all']").click

#Checks if the footer count is 0 when all Todos are selected
  if driver.find_element(:xpath, "//footer[contains(.,'0 items left')]").displayed?
  puts "Test Passed:Item indicator displays 0"
end

#Clears all Todos
driver.find_element(:xpath, "//button[@class='clear-completed']").click

#Click the first created by link
driver.find_element(:xpath, "//a[@href='http://github.com/samccone']").click
if driver.find_element(:xpath, "//div[contains(.,'Sam Saccone')]").displayed?
  puts "Test Passed:The first created by link works"
end

#Navigate back to the todo application
driver.navigate.to "http://todomvc.com/examples/angular2/"

#Click the second created by link
driver.find_element(:xpath, "//a[@href='http://github.com/colineberhardt']").click
if driver.find_element(:xpath, "//div[contains(.,'Colin Eberhardt')]").displayed?
  puts "Test Passed:The second created by link works"
end

#Navigate back to the todo application
driver.navigate.to "http://todomvc.com/examples/angular2/"

#Click the third link in the footer
driver.find_element(:xpath, "//a[@href='http://angular.io']").click
if driver.find_element(:xpath, "//span[contains(.,'Get Started')]").displayed?
  puts "Test Passed:The third link in the footer works"
end

#Navigate back to the todo application
driver.navigate.to "http://todomvc.com/examples/angular2/"

#Click the fourth and last link in the footer
driver.find_element(:xpath, "//a[@href='http://todomvc.com']").click
if driver.find_element(:xpath, "//img[@class='logo-icon']").displayed?
  puts "Test Passed:The fourth link in the footer works"
end

#Navigate back to the todo application
driver.navigate.to "http://todomvc.com/examples/angular2/"

#Quitting the browser
driver.quit

