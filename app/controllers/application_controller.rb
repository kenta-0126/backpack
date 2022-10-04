class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[top about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resorce)
    users_my_page_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name
                                                         first_name
                                                         last_name
                                                         first_name_kana
                                                         last_name_kana
                                                         is_active])
  end
end
