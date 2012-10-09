class StaticPagesController < ApplicationController

  def home
    #size = @user_linkage.size
    @link = Link.new()
    if signed_in?
      @user_linkage = current_user.linkages
    else
      @user_linkage = []
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
