class Student < ApplicationRecord
  include BirthdateValidate
  include CallbackMethods

  validates :first_name, :last_name, :department, presence: true
  validate :birthdate_cannot_be_in_the_future
  validates :email, presence: true, format: { with: /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/ }
  validates :email, uniqueness: true, on: :create
  validates :department, inclusion: { in: %w[CE IT] }
  validates :terms_of_usage, acceptance: true

  before_validation :before_validated # 01/01/2001
  after_initialize :after_init
  after_find :after_found
  before_save :before_saved
  after_save :after_saved
  around_save :around_saved
  before_create :before_created
  after_create :after_created
  around_create :around_created
  before_update :before_updated
  after_update :after_updated
  around_update :around_updated
  before_destroy :before_destroyed
  after_destroy :after_destroyed, if: :deleted?
  around_destroy :around_destroyed
  after_create_commit :total_students_count
  after_update_commit :update_count_message
  after_destroy_commit :log_message_after_delete

  def before_validated
    self.birthdate = '01-01-2001' if birthdate.blank?
  end

  def before_updated
    self.update_counter += 1
    add_callback 'before_updated', 'Action performed by: before_updated callback'
  end

  def after_created
    add_callback 'Email Validation Status:(after_create) ', 'Validated!'
  end

  def deleted?
    !Student.exists?(id)
  end

  def total_students_count
    add_callback 'Student Count: ', Student.count
  end

  def update_count_message
    add_callback 'Student update Count: ', update_counter
  end

  def log_message_after_delete
    add_callback 'LOG of deletion: ', "#{first_name} #{last_name} is deleted from database"
  end
end
