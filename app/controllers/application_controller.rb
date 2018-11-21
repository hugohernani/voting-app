class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :account_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

  def after_sign_in_path_for(resource)
    admin_dashboard_index_path
  end

  private
  def pundit_user
    current_account
  end

  def record_not_found_error
    flash[:error] = t('base.record_not_found')
    redirect_to dashboard_path
  end

  def account_not_authorized
    flash[:alert] = t('admin.authenticated.not_authorized')
    redirect_to(request.referrer || root_path) # TODO update with dashboard_path
  end
end
