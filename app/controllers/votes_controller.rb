class VotesController < ApplicationController
  def create
    if Vote.where(user_id: vote_params[:user_id], partner_id: vote_params[:partner_id]).any?
      redirect_back fallback_location: '/'
      flash[:notice] = "Already Voted !"
    else
      @vote = Vote.new(vote_params)
      @vote.save

      ########## Vote Control
      vote_counter = 0
      @vote.user.votes.each do |vote|
        vote_counter += 1 if vote.status == 'approved'
      end
      if vote_counter > Partner.all.size
        @vote.user.status = true
      end


      redirect_back fallback_location: '/'
    end

  end

  def destroy
  end

  private

  def vote_params
    params.require(:data).permit(:user_id, :partner_id, :status)
  end

end
