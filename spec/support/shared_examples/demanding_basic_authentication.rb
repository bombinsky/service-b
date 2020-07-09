# frozen_string_literal: true

shared_examples 'demanding basic authentication' do |method, action, options = {}|
  context 'without basic authentication' do
    before { public_send(method, action, options) }

    it 'returns unauthorized header' do
      expect(response.status).to eq 401
    end

    it 'responds with content type text/html; charset=utf-8' do
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end

    it 'transmits HTTP Basic: Access denied in body' do
      expect(response.body).to include 'HTTP Basic: Access denied'
    end
  end
end
