# frozen_string_literal: true

EmailTemplate.find_or_create_by!(
  name: 'external_urls_request_results',
  subject: 'External urls in your Twitter home line between {{request_start_time}} and {{request_end_time}}',
  body: File.open(Rails.root + 'spec/fixtures/external_urls_request_results.liquid').read
)
