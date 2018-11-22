class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :account_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

  def after_sign_in_path_for(resource)
    admin_dashboard_index_path
  end

  protected
  def pundit_user
    current_account
  end

  def record_not_found_error(exception)
    flash[:danger] = t("#{exception.model.downcase}", scope: 'record_not_found', default: :default)
    redirect_to root_path
  end

  def account_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:danger] = t("#{policy_name}.#{exception.query}", scope: "pundit", default: :default)
    redirect_to(request.referrer || root_path)
  end
end
