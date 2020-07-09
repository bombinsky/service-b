# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  config.action_mailer.smtp_settings = {
    address: Settings.smtp_server,
    port: Settings.smtp_port,
    user_name: Treasury.smtp_username,
    password: Treasury.smtp_password,
    authentication: :login,
    enable_starttls_auto: true
  }
end