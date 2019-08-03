class PartnerPanelController < ApplicationController
  before_action :has_partner_permission

  def index
    @voted_users = User.includes(:votes).where(active: false, :votes => { partner_id: current_user.id })
    @nonvoted_users = User.includes(:votes).where(active: false)
    @nonvoted_users = @nonvoted_users.reject { |user| (@voted_users.include? user)}
  end

  private
    def has_partner_permission
      unless partner?
        redirect_to root_path
      end
    end
end
