Feature: Localization

Scenario: Changing locale
  Given I am on the sports page
  And I clicked on Italian version of site
  Then I should see a localized info
