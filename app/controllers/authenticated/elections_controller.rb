module Authenticated
  class ElectionsController < BaseController
    def show
      election
    end

    def new
      @election = Election.new
    end

    def create
      @election = Election.new(election_params)

      if @election.save
        redirect_to admin_election_url(@election), notice: 'Election was successfully created.'
      else
        render :new
      end
    end

    private
    def election
      @election ||= Election.find(params[:id])
    end

    def election_params
      params.require(:election).permit(:name, :start_time, :end_time,
        candidates_attributes: [:id, :name, :email, :_destroy],
        voters_attributes: [:email, :_destroy]
      )
    end
  end
end
