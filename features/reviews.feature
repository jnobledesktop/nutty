Feature: Customer Reviews
	As a customer of That Nutty Guy
	I want to read reviews and add my own
	So that I can learn about products
	And share my recommendations with others
Scenario: View Reviews for a Product
	Given that a product exists called "Corkscrew Bill"
	And a review exists for the product
	When I visit the product's page
	Then I should see the text of the review
Scenario: Add a Product Review
	Given that I am logged in as a customer
	And that a product exists called "Corkscrew Bill"
	When I visit the product's page
	And I click the button "write-review"
	Then I should be redirected to "/reviews/new"
	When I fill out and submit the new review form
	Then I should be redirected to "/products/corkscrew-bill"
	And I should see the text of my new review
Scenario: Rate a Product
	Given that I am logged in as a customer
	And that a product exists called "Corkscrew Bill"
	When I visit the product's page
	And I click the button "write-review"
	When I add a rating of 3 stars to the product
	And I fill out and submit the new review form
	Then I should see my rating of 3 stars
Scenario: Composite Rating for a Product
	Given that a product exists called "Corkscrew Bill"
	And that product has a review with a rating of 3 stars
	And that product has a review with a rating of 5 stars
	When I visit the product's page
	Then I should see a composite rating of 4 stars