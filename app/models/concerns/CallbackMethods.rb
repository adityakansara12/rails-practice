module CallbackMethods
  private

  def after_init
    add_callback 'after_initialize', 'Action performed by: after_initialize callback'
  end

  def after_found
    add_callback 'after_find', 'Action performed by: after_find callback'
  end

  def before_saved
    add_callback 'before_save', 'Action performed by: before_save callback'
    self.email = "ror_demo_#{email}" unless email.include? 'ror_demo'
  end

  def after_saved
    add_callback 'after_save', 'Action performed by: after_save callback'
  end

  def around_saved
    add_callback 'around_save', 'Action performed by: around_save callback, before yield'
    yield
    add_callback 'around_save', 'Action performed by: around_save callback, after yield'
  end

  def before_created
    add_callback 'before_create', 'Action performed by: before_create callback'
  end

  def after_created
    add_callback 'after_create', 'Action performed by: after_create callback'
  end

  def around_created
    add_callback 'around_create', 'Action performed by: around_create callback, before yield'
    yield
    add_callback 'around_create', 'Action performed by: around_create callback, after yield'
  end

  def before_updated
    add_callback 'before_update', 'Action performed by: before_update callback'
  end

  def after_updated
    add_callback 'after_update', 'Action performed by: after_update callback'
  end

  def around_updated
    add_callback 'around_update', 'Action performed by: around_update callback, before yield'
    yield
    add_callback 'around_update', 'Action performed by: around_update callback, after yield'
  end

  def before_destroyed
    add_callback 'before_destroy', 'Action performed by: before_destroy callback'
  end

  def after_destroyed
    add_callback 'after_destroy', 'Action performed by: after_destroy callback'
  end

  def around_destroyed
    add_callback 'around_destroy', 'Action performed by: around_destroy callback, before yield'
    yield
    add_callback 'around_destroy', 'Action performed by: around_destroy callback, after yield'
  end
end
