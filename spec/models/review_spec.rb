require 'spec_helper'

describe Review do
  it { should validate_presence_of(:body) }

  it 'should belong to a valid product' do
  	review = FactoryGirl.build(:review, product: nil)
  	review.should_not be_valid
  	review.product = FactoryGirl.create(:product)
  	review.should be_valid
  end

  it 'should have a rating between 1 and 5 stars' do
  	review = FactoryGirl.create(:review)
  	review.rating = 100
  	review.should_not be_valid
  	for i in 1..5
  		review.rating = i
  		review.should be_valid
  	end
  end
end
