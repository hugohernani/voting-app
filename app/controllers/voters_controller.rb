class VotersController < ApplicationController
  def index
    @election = Election.find(params[:election_id])
    authorize @election, :running?
  end
end
