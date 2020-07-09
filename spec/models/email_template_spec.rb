# frozen_string_literal: true

describe EmailTemplate do
  subject(:object) { build :email_template }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :subject }
  it { is_expected.to validate_presence_of :body }
  it { is_expected.to validate_uniqueness_of :name }
end
