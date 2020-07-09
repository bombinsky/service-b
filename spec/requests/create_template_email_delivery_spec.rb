# frozen_string_literal: true

describe 'created email template delivery' do
  include_context 'with email template for external urls request results'

  it 'responds with created' do
    post template_email_deliveries_path, params: { template_email: delivery_params }, env: basic_auth_env, as: :json

    expect(response.code).to eq '201'
  end
end
