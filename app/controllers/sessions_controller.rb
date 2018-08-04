require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    user = User.find_by(:name => params[:user][:name])
    if !user || !user.authenticate(params[:user][:password])
      redirect_to login_path
    else
      session[:user_id] = user.id
      redirect_to homepage_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
