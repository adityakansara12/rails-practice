class Faculty < ApplicationRecord
  include ApplicationHelper

  validates :designation, inclusion: { in: ['Ass. Prof.', 'Prof.'] },
                          exclusion: { in: ['HOD', 'Sr. Prof.'] }
  validates :first_name, :last_name, :birthdate, presence: true
  validate :birthdate, :birthdate_cannot_be_in_the_future
  validates :email, presence: true, uniqueness: true, format: { with: /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/ }
  validates :phone,
            format: { with: /\A[0-9]{10}\z/ }
end
