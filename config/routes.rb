# frozen_string_literal: true

Rails.application.routes.draw do
  resources :template_email_deliveries, only: [:create]
end
