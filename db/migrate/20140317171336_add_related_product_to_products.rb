class AddRelatedProductToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :related_product, index: true
  end
end
