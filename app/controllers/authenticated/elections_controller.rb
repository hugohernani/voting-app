module Authenticated
  class ElectionsController < BaseController
    def show
      authorize election, :admin_show?
    end

    def new
      authorize Election, :admin_new?
      @election = Election.new
    end

    def create
      authorize Election, :admin_create?
      @election = Election.new(election_params)

      if @election.save
        ElectionsCreateService.new(@election).perform
        redirect_to admin_election_url(@election), success: 'Election was successfully created.'
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
