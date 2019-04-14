class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :show_errors

  def show_flash
    flash.now[:notice] = "Found the about page!"
  end

  def show_errors(errors = [])
    if errors.length > 0
      errors.each do |error|
        flash.now[:error] = error
      end
    end
  end
end
