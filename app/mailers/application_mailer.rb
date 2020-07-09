# frozen_string_literal: true

# Application mailer
class ApplicationMailer < ActionMailer::Base
  def send_email(from:, to:, headers:, subject:, body:)
    headers(headers)

    mail(to: to, from: from, subject: subject, body: body, content_type: 'text/html')
  end
end
