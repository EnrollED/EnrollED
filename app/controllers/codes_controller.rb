class CodesController < ApplicationController

  layout 'admin'

  def index
    authorize Post
  end
end
