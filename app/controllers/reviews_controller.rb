class ReviewsController < ApplicationController
	def new
		@review = Review.new
		@product = Product.find(params[:product_id])
		@title = "Add a Review"
	end

	def create
		@review = Review.new(review_params)
		@review.customer = current_customer
		if @review.save
			redirect_to product_path(@review.product), notice: "Your review was added successfully. Thank you!"
		end
	end

	private
	def review_params
		params.require(:review).permit(:title, :body, :product_id, :rating)
	end
end
