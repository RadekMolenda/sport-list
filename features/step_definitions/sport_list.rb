
Given(/^I am on the sports page$/) do
  stub_request(:get, "http://www.betvictor.com/live/en/live/list.json")
      .to_return(:status => 200, :body => File.read("spec/support/list.json"), :headers => {})

  visit "/sports"
end

Then(/^I should see a list of sports$/) do
  expect(page).to have_content "Football"
  expect(page).to have_content "Golf"
  expect(page).to have_content "Tennis"
end
