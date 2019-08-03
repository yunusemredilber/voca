class SessionsController < ApplicationController
  def create
    if session_params[:type] === 'admin'
      if session_params[:password] === "2023"
        session_params[:type] === 'admin'
      end
    elsif session_params[:type] === 'user'
      @user = User.find_by_email(session_params[:email])
      if @user && @user.authenticate(session_params[:password])
        session[:type] = 'user'
        session[:id] = @user.id
      end
    elsif session_params[:type] === 'partner'
      @partner = Partner.find_by_email(session_params[:email])
        if @partner && @partner.authenticate(session_params[:password])
          session[:type] = 'partner'
          session[:id] = @partner.id
        end
    end
  end

  def destroy
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
end
