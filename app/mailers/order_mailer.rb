class OrderMailer < ActionMailer::Base
  default from: "orders@thatnuttyguy.com"

  def confirmation_email(order)
  	@order = order
  	mail(to: @order.email, subject: "Your Order #{order.id} at ThatNuttyGuy.com")
  end
end
