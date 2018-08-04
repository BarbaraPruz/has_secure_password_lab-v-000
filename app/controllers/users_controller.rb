require 'pry'
class UsersController < ApplicationController

  def new
  end

  def create
    binding.pry
    user = User.new(user_params).save
    binding.pry
    redirect_to :controller => 'sessions', :action => 'create', params: user_params
  end

  def homepage
    redirect_to login_path if !session[:name]
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
