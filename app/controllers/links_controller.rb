class LinksController < ApplicationController

  before_filter :signed_in_user, only: [:create]
  include LinksHelper

  def index
     @links = Link.by_user_number(params)
  end

  def create
  end

end
