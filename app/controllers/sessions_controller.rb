class SessionsController < ApplicationController
  skip_before_action :require_logged_in

  def new
    @user = User.new
  end

  def create
      user = User.find_by(name: params[:user][:name])
      user = user.try(:authenticate, params[:user][:password])
      # flash[:notice] = "Sorry, please try again"
    return redirect_to(controller: 'sessions', action: 'new') unless user
      session[:user_id] = user.id
      @user = user
      # flash[:notice] = "Account successfully created"
      redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end
end
