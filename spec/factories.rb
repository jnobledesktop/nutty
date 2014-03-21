FactoryGirl.define do
	factory :product do
		title "A Nutty Product"
		price 19.99
		sku "ABC123"
	end

	factory :review do
		title "Good Review"
		body "This product rules!"
		rating 3
		product
		customer
	end

	factory :customer do
		sequence(:email) { |n| "test#{n}@test.test" }
		password "123123123"
		password_confirmation { password }
	end
end