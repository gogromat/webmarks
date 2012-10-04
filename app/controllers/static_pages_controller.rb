class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @user_linkage = current_user.linkages
    else
      @user_linkage = []
    end

    #size = @user_linkage.size
    #if signed_in?
    #  if size < 12
    #    #12 - 4 = 8
    #    (12-size).times do
    #       @user_linkage.append(current_user.linkages.build(link_id:0))
    #    end
    #  else
    #    @user_linkage.append(current_user.linkages.build(link_id:0))
    #  end
    #end

  end

  def help
  end

  def about
  end

  def contact
  end

end
