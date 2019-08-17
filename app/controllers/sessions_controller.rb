class SessionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :not_found_handler

  def create
    if session_params[:type] === 'admin'
      if session_params[:password] === "20-23"
        session[:type] = 'admin'
        redirect_to admin_panel_path
      else
        flash[:error] = 'Wrong password !'
        redirect_back fallback_location: root_path
      end
    elsif session_params[:type] === 'user'
      @user = User.find_by_email(session_params[:email])
      if @user && @user.authenticate(session_params[:password])
        session[:type] = 'user'
        session[:id] = @user.id
        redirect_to user_panel_path
      else
        flash[:error] = 'Wrong email or password !'
        redirect_back fallback_location: root_path
      end
    elsif session_params[:type] === 'partner'
      @partner = Partner.find_by_email(session_params[:email])
      if @partner && @partner.authenticate(session_params[:password])
        session[:type] = 'partner'
        session[:id] = @partner.id
        redirect_to partner_panel_path
      else
        flash[:error] = 'Wrong email or password !'
        redirect_back fallback_location: root_path
      end
    end
  end

  def destroy
    session[:type] = nil
    session[:id] = nil
    redirect_to root_path
  end


  def user
  end

  def admin
  end

  def partner
  end

  private

  def session_params
    params.require(:data).permit(:email, :password, :type)
  end

  def not_found_handler
    flash[:error] = 'Wrong email !'
    redirect_back fallback_location: root_path
  end
end
