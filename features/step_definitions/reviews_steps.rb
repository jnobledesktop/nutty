Given(/^that a product exists called "(.*?)"$/) do |product_title|
  @product = FactoryGirl.create(:product, title: product_title)
end

Given(/^a review exists for the product$/) do
  @review = FactoryGirl.create(:review, product: @product)
end

When(/^I visit the product's page$/) do
  visit product_path(@product)
end

Then(/^I should see the text of the review$/) do
  page.should have_content("Good Review")
  page.should have_content("This product rules!")
end

Then(/^show me the page$/) do
  save_and_open_page
end

Given(/^that I am logged in as a customer$/) do
  @customer = FactoryGirl.create(:customer)
  @customer.save!

  visit '/customers/sign_in'
  fill_in 'Email', with: @customer.email
  fill_in 'Password', with: '123123123'
  click_button 'Sign in'
  page.should have_content "Signed in successfully."
end

When(/^I click the button "(.*?)"$/) do |button_name|
  click_button button_name
end

Then(/^I should be redirected to "(.*?)"$/) do |destination|
  uri = URI.parse(current_url)
  uri.path.should == destination
end

When(/^I fill out and submit the new review form$/) do
  fill_in 'Title', with: "My Review"
  fill_in 'Body', with: "Corkscrew Bill is the best!"
  click_button "Create Review"
end

Then(/^I should see the text of my new review$/) do
  page.should have_content "My Review"
  page.should have_content "Corkscrew Bill is the best!"
end

When(/^I add a rating of (\d+) stars to the product$/) do |num|
  select num
end

Then(/^I should see my rating of (\d+) stars$/) do |num|
  page.should have_css("h5.star-rating-small." + num.to_i.to_words)
end

Given(/^that product has a review with a rating of (\d+) stars$/) do |num|
  review = FactoryGirl.create(:review)
  review.product = @product
  review.rating = num
  review.save
end

Then(/^I should see a composite rating of (\d+) stars$/) do |num|
  page.should have_css("p.star-rating-large." + num.to_i.to_words)
end