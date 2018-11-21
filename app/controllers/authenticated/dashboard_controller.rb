module Authenticated
  class DashboardController < BaseController
    def index
      @elections = Election.all
    end
  end
end
