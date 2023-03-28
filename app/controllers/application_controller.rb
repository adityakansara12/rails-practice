class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :logged_in?

  $callbacks = {}

  # Callbacks
  def create_callback_hash
    if %w[update destroy create].any? { |i| i == $callbacks.keys.last }
      $callbacks[action_name] = []
    else
      $callbacks = { action_name => [] }
    end
  end

  def logged_in?
    !!session[:user_id] || !!session[:admin]
  end

  def record_not_found
    render file: 'public/404.html', status: 404
  end
end
