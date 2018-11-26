require 'rest_client'

module Blockchain
  class ApiHandler
    def initialize(*args)
      api_base_url = ENV.fetch('API_BASE_URL', 'localhost:4000')
      @api = RestClient::Resource.new("#{api_base_url}/api/", headers: {
        content_type: 'application/json', accept: 'application/json'
      })
    end
  end
end
