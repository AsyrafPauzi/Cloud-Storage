class AdminsController < ApplicationController
  before_action :authenticate_admin!
  
  def index

  	@user = User.all
  	@file = Storage.where(user_id: @user).all
  end

   def show
  end
  
end