Feature: Sport list
Scenario: homepage
  Given I am on the homepage
  Then I should see a list of sports

Scenario: List all sports
  Given I am on the sports page
  Then I should see a list of sports

Scenario: Method to list all events for a given sport
  Given I clicked on Football sport
  Then I should see an ordered list of Football events

Scenario: Method to list all outcomes for a given event
  Given I clicked on Football event
  Then I should see a list of outcomes
