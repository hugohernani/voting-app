class Authenticated::BaseController < ApplicationController
  layout 'authenticated'
  # before_action :authenticate_account!
end
