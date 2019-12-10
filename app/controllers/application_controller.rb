class ApplicationController < ActionController::Base

    # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_logged_in
  helper_method :current_user
  helper_method :logged_in?
  before_action :current_patient

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def current_patient
      @patient = Patient.find_by(id: params[:patient_id])
  end

  def logged_in?
    current_user.id != nil
  end

  def require_logged_in
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end
end
