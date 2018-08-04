class SessionsController < ApplicationController
  def new
  end

  def create
    if !params[:name].present?
      redirect_to login_path
    else
      session[:id] = User.find_by(:name => params[:name])
      redirect_to homepage_path
    end
  end

  def destroy
    session.delete :id
    redirect_to '/'
  end

end
