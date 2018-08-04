require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    if !params[:user][:name].present?
      redirect_to login_path
    else
      session[:user_id] = User.find_by(:name => params[:user][:name]).id
      redirect_to homepage_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
