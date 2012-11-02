class LinkagesController < ApplicationController

  before_filter :signed_in_user
  include ApplicationHelper
  include ImageHelper

  def new
    @link = Link.new()
  end

  def create
    @link = Link.new(params[:link])

    if @link.save and current_user.linkages.create(link_id: @link.id)

      add_website_image(@link)
      #path_and_image = get_website_path_and_image(@link)
      #resize_website_image(path_and_image)

      flash.now[:success] = "Link to \"#{@link.content}\" (#{@link.uri}) was successfully added!"

      respond_to do |format|
        format.js do
          if request.referer == root_url
            @user_linkage = current_user.linkages
            render 'users/user_linkage.js.erb'
          end
        end
        format.html do
            redirect_to root_url
        end
      end

    else
      flash.now[:error] = "Invalid Link, Text, or both"

      respond_to do |format|
        format.html do
          render 'new'
        end
        format.js
      end
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

=begin
  def update
    @link = Link.find(params[:id])
    #TODO check if other users have it ...
    if @link.update_attributes(params[:link])
      flash.now[:success] = "Link was successfully updated!"
    else
      render action: :edit
    end
  end
=end

  def order
    ordered_linkages = params[:linkage]
    @user_linkage = current_user.linkages.find(ordered_linkages)

    @user_linkage.each do |item|
      item.update_attributes!({order: ordered_linkages.index(item.id.to_s)+1}
                              .reject{|k,v| v.blank?})
    end

    flash.now[:success] = "New order is saved #{emoticon}"

    respond_to do |format|
      format.all do
        if request.referer == root_url
          @link = Link.new()
          @user_linkage = current_user.linkages
          render 'users/user_linkage.js.erb'
        end
      end

    end

  end


  def destroy
    @linkage = current_user.linkages.find_by_id(params[:id])
    @link    = Link.find_by_id(@linkage.link_id)
    current_user.unlink!(params[:id])
    flash.now[:success] = "Link to #{@link.content} (#{@link.uri}) was successfully deleted"

    respond_to do |format|
      format.js   {
        #render json: @todo, content_type: 'text/json'
        render 'shared/flash_message'
      }
      format.html { redirect_to root_path }
    end
  end

end
