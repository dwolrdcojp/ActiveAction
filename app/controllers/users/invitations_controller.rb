class Users::InvitationsController < Devise::InvitationsController  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    super
    User.invite!(:email => params[:email])
    User.where(email: params[:user][:email]).update_all(account_id: current_account.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:account_id])
  end

end

