# frozen_string_literal: true

shared_examples 'unsuccessful response' do |resonse_code, error_message|
  it 'returns unauthorized header' do
    expect(response.status).to eq resonse_code
  end

  it 'responds with content type application/json; charset=utf-8' do
    expect(response.content_type).to eq 'application/json; charset=utf-8'
  end

  it 'transmits error message' do
    expect(JSON.parse(response.body)['errors'].first).to include error_message
  end
end
