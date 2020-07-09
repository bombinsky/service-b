# frozen_string_literal: true

class AddExternalUrlsRequestResultsTemplate < ActiveRecord::Migration[6.0]
  TEMPLATE_NAME = 'external_urls_request_results'

  def up
    EmailTemplate.find_or_create_by!(
      name: TEMPLATE_NAME,
      subject: subject,
      body: body
    )
  end

  def down
    EmailTemplate.find_by(name: TEMPLATE_NAME)&.destroy!
  end

  private

  def subject
    "External urls in your Twitter home line between {{request_start_time}} and {{request_end_time}}"
  end

  def body
    File.open(Rails.root + 'spec/fixtures/external_urls_request_results.liquid').read
  end
end
