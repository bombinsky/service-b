# frozen_string_literal: true

# Module needed to requests tests of controllers guarded by BasicAuth
module ClientApiHelper
  def basic_auth_env
    basic_auth_env_with(Treasury.service_b_basic_auth_username, Treasury.service_b_basic_auth_password)
  end

  def basic_auth_env_with(username, password)
    {
      'HTTP_AUTHORIZATION' =>
        ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
    }
  end
end
