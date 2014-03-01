Given(/^I am on the sports page$/) do
  stub_request(:get, "http://www.betvictor.com/live/en/live/list.json")
      .to_return(:status => 200, :body => File.read("spec/support/list.json"), :headers => {})

  visit "/sports"
end

Then(/^I should see a list of sports$/) do
  expect(page).to have_content "Football Tennis Basketball Rugby League Cricket Golf Baseball Virtual Horse Racing Virtual Dog Racing Virtual Football Virtual Tennis Virtual Motor Racing Virtual Speedway Virtual Cycling"
end

Given(/^I clicked on Football sport$/) do
  step "I am on the sports page"
  click_link("Football")
end

Then(/^I should see an ordered list of Football events$/) do
  expect(page).to have_content "Godoy Cruz v Gimnasia La Plata Ituano SP v CA Linense Colo Colo v Cobresal General Diaz v Guarani (Par) Internacional RS v Esportivo Rs"
end

Given(/^I clicked on Football event$/) do
  step "I clicked on Football sport"
  click_link("Godoy Cruz v Gimnasia La Plata")
end

Then(/^I should see a list of outcomes$/) do
  expect(page).to have_content "Market: Match Betting - 90 Mins, Godoy Cruz: 12/1 Market: Match Betting - 90 Mins, Draw: 6/1 Market: Match Betting - 90 Mins, Gimnasia La Plata: 2/11"
end
