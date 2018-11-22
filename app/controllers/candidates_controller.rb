class CandidatesController < ApplicationController

  def edit
    authorize candidate
    candidate.accepted_election_invitation!

    CandidateMailer.follow_up(candidate).deliver_now
    flash.now[:success] = "You've been accepted!"
    render :show
  end

  def show
    authorize candidate
  end

  private
  def candidate
    @candidate ||= Candidate.find(params[:id])
  end
end
