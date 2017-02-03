class WelcomeController < ApplicationController
     layout "frontend"
  def index
  	@products = Product.all.limit(6)
  	@message = Message.new
  end

  def cart
  end
end
