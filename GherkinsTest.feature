Feature: As a user I can enter in the search term “qa testing” in the search box 
and see the results of that search on the search results page 

Scenario: ¬ 
Given Amazon.com page load
And Search box is displayed on Amazon.com
When User click in the search box
And Enters text 
And Clicks go
Then QA testing results are displayed
And The number of results are displayed as a positive integer
