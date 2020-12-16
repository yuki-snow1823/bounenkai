class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about, :danger, :dangerbtn]
	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception

  protected
  def after_sign_in_path_for(resource)
    if params[:user][:name] == "Nishikawa"
      ougon_path
    else
      user_path(resource)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
