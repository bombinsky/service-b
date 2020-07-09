# frozen_string_literal: true

class SendEmailTemplate
  def initialize(from:, to:, headers:, template_name:, template_payload:)
    @from = from
    @to = to
    @headers = headers
    @template_name = template_name
    @template_payload = template_payload
  end

  def call
    ApplicationMailer.send_email(from: from, to: to, headers: headers, subject: subject, body: body).deliver
  end

  private

  attr_reader :from, :to, :headers, :template_name, :template_payload

  def email_template
    @email_template ||= EmailTemplate.find_by!(name: template_name)
  end

  def subject
    Liquid::Template.parse(email_template.subject).render(template_payload)
  end

  def body
    Liquid::Template.parse(email_template.body).render(template_payload)
  end
end