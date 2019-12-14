class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :persist_last_visited_path

  def after_sign_in_path_for(resource)
    if session[:last_visited_path].present?
      session[:last_visited_path]
    else
      root_path
    end
  end

  private

  def persist_last_visited_path
    unless Rails.configuration.ignored_paths.include?(request.path) || request.xhr?
      session[:last_visited_path] = request.path
    end
  end

end
