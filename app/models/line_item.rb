class LineItem < ActiveRecord::Base
  belongs_to :itemized, polymorphic: true
  belongs_to :product

  delegate :price, :title, :sku, to: :product
  delegate :image, :related_product, to: :product, allow_nil: true

  def subtotal
  	price * quantity
  end
end
