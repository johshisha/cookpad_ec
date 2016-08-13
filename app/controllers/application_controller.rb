class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, unless: :valid_api_request?

  private

  def valid_api_request?
    # FIXME need authentivation for realworld application
    request.format.json?
  end
end
