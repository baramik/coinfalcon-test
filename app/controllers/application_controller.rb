class ApplicationController < ActionController::Base

  protected 

  def after_sign_in_path_for(resource)
    my_address_users_path
  end

  def after_inactive_sign_up_path_for(resource)
    my_address_users_path
  end

  def authenticate_user_from_token! 
    if claims and user = User.find_by(email: claims[0]['user']) 
      @current_user = user 
    else 
      invalid_authentication 
    end 
  end 

  def jwt_token(user) 
    JsonWebToken.encode('user' => user.email)
  end
  # JWT's are stored in the Authorization header using this format:
  def claims
    auth_header = request.headers['Authorization'] and
    token = auth_header.split(' ').last and
    JsonWebToken.decode(token)
  rescue
    nil
  end

  def invalid_authentication
    render json: {error: t('devise.failure.unauthenticated')}, status: :unauthorized
  end
end
