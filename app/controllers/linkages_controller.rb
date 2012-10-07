class LinkagesController < ApplicationController

  before_filter :signed_in_user

  def create
    @link = Link.new(content: params[:content], uri: params[:uri])
    if @link.save and current_user.linkages.build(link_id: @link.id).save
      flash.now[:success] = "Link to \"#{@link.content}\" was successfully added!"

      respond_to do |format|
        format.html do
            redirect_to root_url
        end
        format.js #{ render :update }#{ render 'linkages/create' }
      end
    else
      flash.now[:error] = "Invalid Link, Text, or both"

      respond_to do |format|
        format.html do
          render 'new'
        end
        format.js #{ render :update }#{ render 'linkages/create' }
      end
    end
  end


end
