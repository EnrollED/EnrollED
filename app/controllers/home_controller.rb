class HomeController < ApplicationController

  def index
  end

  def sifranti
    authorize Post
  end
end
