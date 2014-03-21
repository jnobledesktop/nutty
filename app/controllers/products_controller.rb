class ProductsController < ApplicationController
  before_action :prepare_redcarpet, :load_cart

  def index
    @get_nutty = true
    @products = Product.all
    respond_to do |format|
      format.html
      format.json { render json: @products, only: [:title, :sku, :price], methods: [:image_thumb] }
      format.xml { render xml: @products, only: [:title, :sku, :price], methods: [:image_thumb] }
    end
  end

  def show
    @product = Product.find(params[:id])
    @title = @product.title
  end

  private
  	def prepare_redcarpet
  		# prepare a Redcarpet Markdown Renderer for description & specs fields
  		@redcarpet = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  	end
end
