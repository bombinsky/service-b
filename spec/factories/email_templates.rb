# frozen_string_literal: true

FactoryBot.define do
  factory :email_template do
    sequence(:name) { |i| "Name#{i}" }
    subject { 'Subject' }
    body { 'MyText' }

    trait :external_urls_request_results do
      name { 'external_urls_request_results' }
      subject { "External urls in your's Twitter home line between {{request_start_time}} and {{request_end_time}}" }
      body { <<-BODY
        Welcome {{nickname}},

        We've just finished processing your's request for external urls found in your's Twitter home line.
        Below you will find a details of the request and information about desired results.

        Request id : {{request_id}}
        Created at : {{request_created_at}}
        Completed at : {{request_updated_at}}

        Examined time range since : {{request_start_time}}
        Examined time range up to : {{request_end_time}}

        {% unless urls == empty %}
          There is a list of external urls found in your Twitter home line.
          {% for url in urls %}
            {{url}}
          {% endfor %}
        {% endunless %}

        {% if urls == empty %}
          It looks like this time there were no external urls in your Twitter home line. 
        {% endif %}

        Best Regards,
        Service A Team :)
      BODY
      }
    end
  end
end
