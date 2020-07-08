class ApplicationMailer < ActionMailer::Base

  def send_email(from:, to:, subject:, headers:, body:)
    headers(headers)

    mail(to: to, from: from, subject: subject, body: body)
  end
end
