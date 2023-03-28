class Faculty < ApplicationRecord
  include BirthdateValidate
  include CallbackMethods

  validates :designation, inclusion: { in: ['Ass. Prof.', 'Prof.'] },
                          exclusion: { in: ['HOD', 'Sr. Prof.'] }
  validates :first_name, :last_name, :birthdate, presence: true
  validate :birthdate, :birthdate_cannot_be_in_the_future
  validates :email, presence: true, format: { with: /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/ }
  validates :email, uniqueness: true, on: :create
  validates :phone,
            format: { with: /\A[0-9]{10}\z/ }

  after_initialize :after_init
  after_validation :after_validated
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
  after_destroy :after_destroyed
  around_destroy :around_destroyed
  after_create_commit :total_faculties_count
  after_update_commit :update_count_message
  after_destroy_commit :log_message_after_delete

  def after_validated
    self.age = Date.today.year - birthdate.year
  end

  def before_updated
    self.update_counter += 1
    add_callback 'before_updated', 'Action performed by: before_updated callback'
  end

  def total_faculties_count
    add_callback 'Faculty Count: ', Faculty.count
  end

  def update_count_message
    add_callback 'Faculty update Count: ', update_counter
  end

  def log_message_after_delete
    add_callback 'LOG of deletion: ', "#{designation} #{first_name} #{last_name} is deleted from database"
  end
end
