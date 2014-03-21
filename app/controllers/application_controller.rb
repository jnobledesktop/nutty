class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	private
	def load_cart
		return false unless customer_signed_in?
		current_customer.create_cart if current_customer.cart.nil?
		@cart = current_customer.cart
		
	end

	def load_cart_or_redirect_customer
		unless load_cart
			redirect_to new_customer_session_path, alert: "Please sign in to access your cart." and return
		end
	end

end
