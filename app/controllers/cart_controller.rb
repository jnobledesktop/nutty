class CartController < ApplicationController
	before_action :load_cart_or_redirect_customer

	def index
		@title = "Your Cart"
	end

	def complete
		@order = Order.new(customer: current_customer)
		@order.line_items = @cart.line_items
		@order.save
		@cart.delete

		OrderMailer.confirmation_email(@order).deliver

		@title = "Your Order is Complete"
		@related_products = @order.line_items.collect(&:related_product).reject(&:nil?)
	end

end
