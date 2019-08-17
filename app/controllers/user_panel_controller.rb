class UserPanelController < ApplicationController
  before_action :has_user_permission

  def index
  end

  private
  def has_user_permission
    unless user?
      redirect_to root_path
    end
  end
end
