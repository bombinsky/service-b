# frozen_string_literal: true

# Controller responsible for creatingTemplateEmailDelivery (Just sending email)
class TemplateEmailDeliveriesController < ApplicationController
  def create
    SendEmailTemplate.new(created_email_params.to_h.symbolize_keys).call

    head :created
  end

  private

  def created_email_params
    permitted_params.require :from
    permitted_params.require :to
    permitted_params.require :template_name
    permitted_params.require :template_payload
    permitted_params.require :headers
    permitted_params
  end

  def permitted_params
    @permitted_params ||= params.require(:template_email)
                                .permit(:from, :to, :template_name, template_payload: {}, headers: {})
  end
end
