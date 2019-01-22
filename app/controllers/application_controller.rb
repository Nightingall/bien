class ApplicationController < ActionController::Base

  before_action :find_current_user

  helper_method :is_logged_in?

  def find_current_user
    if is_logged_in?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def check_login
    unless is_logged_in?
      redirect_to new_session_path
    end
  end

  def is_logged_in?
    session[:user_id].present?
  end

  def check_admin
    @user = find_current_user
    unless @user.present && @user.is_admin?
      redirect_to root_path
    end
  end
end
