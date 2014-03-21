class AddItemizedToLineItems < ActiveRecord::Migration
  def up
    add_reference :line_items, :itemized, polymorphic: true, index: true
    LineItem.all.each do |li|
    	li.itemized_id = li.cart_id
    	li.itemized_type = 'Cart'
    	li.save!
    end
    remove_reference :line_items, :cart
  end
 
    def down
    	add_reference :line_items, :cart, index: true
    	LineItem.all.each do |li|
    		li.cart_id = li.itemized_id
    		li.save!
    	end
    	remove_reference :line_items, :itemized, polymorphic: true
    end
end
