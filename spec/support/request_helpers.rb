module Requests
  module JsonHelpers
    def json_response
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
