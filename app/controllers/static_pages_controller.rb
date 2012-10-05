class StaticPagesController < ApplicationController

  def home
    #size = @user_linkage.size
    if signed_in?
      #current_user.linkages.build(link_id:0)
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
