# frozen_string_literal: true

class EmailTemplate < ApplicationRecord

  validates :subject, presence: true
  validates :body, presence: true
  validates :name, presence: true, uniqueness: true

end
