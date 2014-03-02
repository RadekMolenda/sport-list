Given(/^I clicked on Italian version of site$/) do
  click_link("IT")
end

Then(/^I should see a localized info$/) do
  expect(page).to have_title "Radek Molenda: Italian title"
end
