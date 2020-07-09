# frozen_string_literal: true

shared_context 'with email template for external urls request results' do
  let(:email_template) { create :email_template, :external_urls_request_results }
  let(:template_name) { email_template.name }
  let(:template_payload) do
    {
      nickname: 'nickname',
      request_id: 'request_id',
      request_start_time: '2020-07-01 10:45',
      request_end_time: '2020-07-04 10:45',
      request_created_at: '2020-07-05 13:45:34',
      request_updated_at: '2020-07-05 13:55:49',
      urls: [
        'https://wp.pl',
        'https://amazon.com',
        'https://youtube.com'
      ]
    }
  end

  let(:delivery_params) do
    {
        from: 'from@email.com',
        to: 'to@email.com',
        headers: { 'Reply-To': 'reply-to@email.com' }.stringify_keys,
        template_name: template_name,
        template_payload: template_payload.stringify_keys
    }
  end
end
