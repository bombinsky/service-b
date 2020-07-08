FactoryBot.define do
  factory :email_template do
    sequence(:name) { |i| "Name#{i}" }
    required_payload { 'MyText' }
    subject { 'Subject' }
    body { 'MyText' }
  end
end
