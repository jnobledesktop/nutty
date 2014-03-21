class Cart < ActiveRecord::Base
  include CheckoutSharedMethods
  
  belongs_to :customer

  has_many :line_items, as: :itemized
  has_many :products, through: :line_items

  delegate :email, to: :customer

end
