class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  before_action :find_current_tenant

  def find_current_tenant
    current_account = Account.second
    set_current_tenant(current_account)
  end
end
