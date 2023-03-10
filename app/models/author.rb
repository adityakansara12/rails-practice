class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 15, too_long: '15 characters are maximum allowed' }
  validates :last_name, presence: true, length: { maximum: 15, too_long: '15 characters are maximum allowed' }
  validates_date :date_of_birth, presence: true, on_or_before: -> { Date.current }
  validates :email, presence: true, email: true,
                    length: { maximum: 50, too_long: "#{count} characters are maximum allowed" }, uniqueness: true
end
