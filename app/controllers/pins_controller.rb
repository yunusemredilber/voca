class PinsController < ApplicationController

  def create
    @pin = Pin.new(pin_params)
    @pin.code = rand(1000..10000)
    @pin.save
    redirect_back fallback_location:'/'
  end

  private

  def pin_params
    params.require(:data).permit(:user_id)
  end
end
