class SessionsController < ApplicationController
  def create
    session[:password] = params[:password]
    redirect_to :controller => :activities, :action => :index
  end

  def destroy
    reset_session
    redirect_to :action => :new
  end

end
