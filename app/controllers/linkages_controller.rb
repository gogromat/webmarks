class LinkagesController < ApplicationController

  before_filter :signed_in_user

  def new
  end

  def create
    @link = Link.new(content: params[:content], uri: params[:uri])
    if @link.save and current_user.linkages.build(link_id: @link.id).save
      flash[:success] = "Link to \"#{@link.content}\" was successfully added!"
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    else
      flash.now[:error] = "Invalid Link, Text, or both"
      render 'new'
    end
  end



end
