module RailsSourcePath
  extend ActiveSupport::Concern

  included do
    helper_method :rails_source_path
  end

  class_methods do
    # Used in controller:
    #   rails_source_path_entry_actions :new, :edit
    def rails_source_path_entry_actions(*methods)
      before_action :set_rails_source_path, only: methods.flatten
    end
  end

  # rails_source_path is used in View like 'cancel/back' button
  def rails_source_path(default_path = root_path)
    session[:rails_source_path] || default_path
  end

  # used in controller when object is successfully created or updated
  def redirect_to_source(default_path = root_path)
    path = rails_source_path(default_path)
    session.delete(:rails_source_path)
    redirect_to path
  end

  private

  def set_rails_source_path
    session[:rails_source_path] = begin
      URI(request.referer).request_uri
    rescue
      nil
    end
  end
end
