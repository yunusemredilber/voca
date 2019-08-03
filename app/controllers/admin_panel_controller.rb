class AdminPanelController < ApplicationController
  before_action :has_admin_permission

  def index
    @partner = Partner.new
    @partners = Partner.all
  end

  private
  def has_admin_permission
    unless admin?
      redirect_to root_path
    end
  end
end
