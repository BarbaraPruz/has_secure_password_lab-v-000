require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    if !params[:user][:name].present?
      redirect_to login_path
    else
      binding.pry
      session[:id] = User.find_by(:name => params[:user][:name])
      redirect_to homepage_path
    end
  end

  def destroy
    session.delete :id
    redirect_to '/'
  end

end
