# frozen_string_literal: true

# Module needed to test controllers guarded by BasicAuth
module BasicAuthHelper
  def http_authenticate
    http_authenticate_with(Treasury.service_b_basic_auth_username, Treasury.service_b_basic_auth_password)
  end

  def http_authenticate_with(username, password)
    request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end
end
