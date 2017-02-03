class ManagerController < ApplicationController

before_action :authenticate_manager!

  def index
  	@bikes = Product.all
  end

  def products
  	@products = Product.all
  	
  end


   def messages
      @messages = Message.all.where( :tipo => false)
  end 
  

end