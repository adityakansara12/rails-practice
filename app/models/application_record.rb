class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def add_callback(callback_name, action_message)
    return if $callbacks[$callbacks.keys.last].include?({ callback_name => action_message })

    $callbacks[$callbacks.keys.last].append({ callback_name => action_message })
  end
end
