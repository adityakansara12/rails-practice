class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum:10 }
  validate :custom_validation

  #custom validations
  def custom_validation
    puts "Custom validation running"
    true
  end

  #callbacks
  before_save :before_save
  after_save  :after_save
  around_save :around_save
  before_create :before_create
  after_create :after_create
  around_create :around_create
  before_update :before_update
  after_update :after_update
  around_update :around_update
  before_destroy :before_destroy
  after_destroy :after_destroy
  around_destroy :around_destroy
  after_commit :after_commit
  after_rollback :after_rollback

  def before_save
    puts "message from 'before_save' callback"
  end
  def after_save
    puts "message from 'after_save' callback"
  end
  def around_save
    puts "message from 'around_save' callback"
    yield
    puts "message from 'around_save' callback"
  end
  def before_create
    puts "message from 'before_create' callback"
  end
  def after_create
    puts "message from 'after_create' callback"
  end
  def around_create
    puts "message from 'around_create' callback"
    yield
    puts "message from 'around_create' callback"
  end
  def before_update
    puts "message from 'before_update' callback"
  end
  def after_update
    puts "message from 'after_update' callback"
  end
  def around_update
    puts "message from 'around_update' callback"
    yield
    puts "message from 'around_update' callback"
  end
  def before_destroy
    puts "message from 'before_destroy' callback"
  end
  def after_destroy
    puts "message from 'after_destroy' callback"
  end
  def around_destroy
    puts "message from 'around_destroy' callback"
    yield
    puts "message from 'around_destroy' callback"
  end
  def after_commit
    puts "message from 'after_commit' callback"
  end
  def after_rollback
    puts "message from 'after_rollback' callback"
  end
end
