class VoteController < ApplicationController
  def new
    @candidate = Candidate.find(params[:candidate_id])
    authorize @candidate.election, :running?
    @election = @candidate.election
  end

  def create
    ballot = Ballot.find(ballot_params[:id])
    authorize ballot
    if ballot.update(voted: true, candidate_id: ballot_params[:candidate_id], election_id: ballot_params[:election_id])
      flash[:success] = "Your vote has being counted."
      redirect_to election_path(ballot.election)
    end
  end

  def show
    @election = Election.find(params[:id])
    # TODO Show a receipt so that the voter can have a way to prove his vote is being counted
  end

  private
  def ballot_params
    params.require(:ballot).permit(:id, :candidate_id, :election_id)
  end
end
