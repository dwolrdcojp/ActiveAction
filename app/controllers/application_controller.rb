class ApplicationController < ActionController::Base

  set_current_tenant_through_filter
  before_action :find_current_tenant

  def find_current_tenant
    current_account_id = user_signed_in? ? current_user.account : nil
    set_current_tenant(current_account_id)
  end

  def authenticate_inviter!
    authenticate_account!(force: true)
  end
end
