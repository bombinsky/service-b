class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  before_action :http_authenticate!

  rescue_from Liquid::UndefinedVariable, with: :unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :unprocessable_entity

  respond_to :json

  protected

  def http_authenticate!
    authenticate_or_request_with_http_basic('Application') do |username, password|
      (username == Treasury.service_b_basic_auth_username && password == Treasury.service_b_basic_auth_password)
    end
  end

  def record_not_found(exception)
    render json: { errors: [exception.message] }, status: :not_found
  end

  def unprocessable_entity(exception)
    render json: { errors: [exception.message] }, status: :unprocessable_entity
  end
end
