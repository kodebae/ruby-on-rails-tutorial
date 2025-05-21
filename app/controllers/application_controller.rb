class ApplicationController < ActionController::Base
  # Make current_user available in views
  helper_method :current_user

  # Stubbed: no user is ever logged in
  def current_user
    nil
  end
end
