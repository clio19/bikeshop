class AdminController < ApplicationController

before_action :authenticate_admin!

  def index
  	@bikes = Product.all
  end



end
