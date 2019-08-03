class PartnersController < ApplicationController

  # POST /users
  # POST /users.json
  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      redirect_back fallback_location: '/'
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
    redirect_back fallback_location: '/'
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def partner_params
    params.require(:partner).permit(:appellation, :email, :password, :password_confirmation)
  end
end
