class ApplicationController < ActionController::Base

  helper_method [:user?, :partner?, :admin?, :current_user]

  def user?
    session[:type] == 'user'
  end

  def partner?
    session[:type] == 'partner'
  end

  def admin?
    session[:type] == 'admin'
  end

  def current_user
    if user?
      @user ||= User.find(session[:id])
    elsif partner?
      @partner ||= Partner.find(session[:id])
    end
    @user || @partner
  end
end
