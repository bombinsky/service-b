# frozen_string_literal: true

FactoryBot.define do
  factory :email_template do
    sequence(:name) { |i| "Name#{i}" }
    subject { 'Subject' }
    body { 'MyText' }

    trait :external_urls_request_results do
      name { 'external_urls_request_results' }
      subject { "External urls in your's Twitter home line between {{request_start_time}} and {{request_end_time}}" }
      body { File.open(Rails.root + 'spec/fixtures/external_urls_request_results.liquid').read }
    end
  end
end
