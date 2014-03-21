class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :customer

  validates :body, presence:true
  validate :belongs_to_valid_product
  validate :rating_must_be_between_1_and_5

  def belongs_to_valid_product
  	p = Product.find_by(id: product_id)
  	errors.add(:product, "Review must belong to a valid product") if p.nil?
  end

  def rating_must_be_between_1_and_5
  	unless [1,2,3,4,5].include? rating
  		errors.add(:rating, "Rating must be between 1 and 5")
  	end
  end
end
