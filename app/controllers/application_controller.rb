class ApplicationController < ActionController::Base
  before_action :cofigure_permitted_parameters, if: :devise_controller?
  
  def set_user_id_to_cookie
    if current_user
      cookies.signed["user.id"] = current_user.id
    end
  end


  
  private

  def cofigure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :sex_id, :birthday, :image, :self_introduction, :interest, :profession, :work_place, :educational_background, :resident])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :sex_id, :birthday, :image, :self_introduction, :interest, :profession, :work_place, :educational_background, :resident])
  end

  def after_sign_in_path_for(_resource)
    homes_path
  end
end
