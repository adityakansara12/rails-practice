class Student < ApplicationRecord
  include ApplicationHelper

  validates :first_name, :last_name, :department,:birthdate, presence: true
  validate :birthdate_cannot_be_in_the_future
  validates :department, inclusion: { in: ["CE", "IT"] }
  validates :terms_of_usage, acceptance: true

end
