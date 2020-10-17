class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  def authenticate_api
    unauthorized = true
    authorization_details = request.headers['Authorization']
    if authorization_details
      user, one_time_api_key = User.find_by_one_time_api_token(authorization_details.split(' ')[1])
      if user.present?
        params[:current_user] = user 
        params[:one_time_api_key] = one_time_api_key 
        unauthorized = false
      end
    end
    if unauthorized
      Rails.logger.error("NOt Authenticated")
      render :json => {:message => "Not Authorized!"}, :status => :unauthorized
      return
    end
  end

  def authenticate_api_for_one_time_key
    unauthorized = true
    authorization_details = request.headers['Authorization']
    if authorization_details
      user = User.find_by_api_token(authorization_details.split(' ')[1])
      if user.present?
        params[:current_user] = user 
        unauthorized = false
      end
    end
    if unauthorized
      render :json => {:message => "Not Authorized!"}, :status => :unauthorized
      return
    end
  end

  def after_sign_in_path_for(resource)
    home_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :full_name)  }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, password_confirmation) }
  end
  
end
