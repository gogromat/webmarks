class LinksController < ApplicationController

  before_filter :signed_in_user, only: []

  def index
     @links = Link.by_user_number(params)
  end


end
