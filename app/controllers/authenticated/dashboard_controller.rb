module Authenticated
  class DashboardController < BaseController
    def index
      @elections = current_account.elections
    end
  end
end
