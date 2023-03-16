class ApplicationController < ActionController::Base
  $callbacks = {}

  # Callbacks
  def create_callback_hash
    if %w[update destroy create].any? { |i| i == $callbacks.keys.last }
      $callbacks[action_name] = []
    else
      $callbacks = { action_name => [] }
    end
  end
end
