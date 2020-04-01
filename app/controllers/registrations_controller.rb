class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def destroy
    if current_user.admin? # If current user is admin, check
      if User.where(admin: true).count > 1 # If there is more than 1 admin, allow delete account
        resource.destroy
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'User was successfully deleted.' }
          format.json { head :no_content }
        end
      else # There is 1 admin
        flash[:alert] = "You are the only admin. Please make someone else admin before deleting your account."
        redirect_to request.referrer
      end
    else # If current user not admin
      resource.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'User was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:username, :email, :password, :password_confirmation, :current_password)
    end
  end
  
  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

end