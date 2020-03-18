class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :persist_last_visited_path

  # Check if there was a last_visited_path saved and make sure that path is not blank
  # Otherwise redirect to home page
  def after_sign_in_path_for(resource)
    if session[:last_visited_path].present? && !session[:last_visted_path].blank?
      session[:last_visited_path]
    else
      root_path
    end
  end

  private

  # Used for saving the previous location for loading back to after sign in
  def persist_last_visited_path
    unless Rails.configuration.ignored_paths.include?(request.path) || request.xhr?
      session[:last_visited_path] = request.path
    end
  end

end
