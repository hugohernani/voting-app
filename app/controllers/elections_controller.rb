class ElectionsController < ApplicationController
  def show
    @election = Election.find(params[:id])
    authorize @election
  end
end
