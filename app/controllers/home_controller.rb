class HomeController < ApplicationController

  def index
    redirect_to application_forms_path
  end
end
