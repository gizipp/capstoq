class ApplicationAPIController < ActionController::API

  protected

  def authenticate_user!
    token = get_bearer_token
    user  = get_user(token)

    if token && user
      sign_in(user)
    else
      render json: { errors: "Unauthorized"}, status: :unauthorized
    end
  end

  private

  def get_bearer_token
    pattern = /^Bearer/
    header = request.authorization
    header = request.env['Authorization'] if header.blank?
    header.gsub(pattern, '').strip if header && header.match(pattern)
  end

  def get_user(token)
    secret = Rails.application.credentials.jwt[:secret_key]
    method = Rails.application.credentials.jwt[:algorithm]

    begin
      raw  = JWT.decode(token, secret, true, { algorithm: method })[0]
      data = raw['data']

      User.find_by(email: data['email'])
    rescue
      nil
    end
  end
end
