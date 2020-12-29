class Users::InvitationsController < Devise::InvitationsController  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    super
    User.invite!({:email => params[:email], :account_id => current_account.id}, current_account)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:account_id])
  end

end

