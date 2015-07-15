require 'rspec'
require 'selenium-webdriver'


RSpec.describe "amazontest" do

before (:all) do
	# Create a webdriver driver
	@driver = Selenium::WebDriver.for :firefox

	# Navigate to the website 
	@driver.navigate.to "https://amazon.com"

end

it 'should click in search box' do
	#click in search field
	@driver.find_element(:id, 'twotabsearchtextbox').click

	puts "Search box selected"
end


it 'should enter QA testing in the search box' do
	#type "qa testing" in the search box
	@driver.find_element(:id, 'twotabsearchtextbox').send_keys "qa testing"

	puts "Search criteria entered"

end

it 'should click the go button' do
	#Click the go button"
	@driver.find_element(:xpath, "//input[@value='Go']").click

	puts "Go button clicked"
end

it 'should verify search results are displayed' do
	#Verify that qa testing search results are displayed
	results = @driver.find_element(:id, 's-result-count')
    results if results.displayed?

	puts "Search results displayed"
end

it 'should verify the number of results are displayed as a positive interger' do
	#Verify that results are a positive interger
	string = @driver.find_element(:id, 's-result-count')
	expect(string).not_to equal (0)

	puts "Number of results are a positive interger"

end

after(:all) do
	@driver.quit
end

end


