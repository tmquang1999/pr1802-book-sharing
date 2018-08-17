class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t ".flash_danger"
    redirect_to login_url
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
