class LinkagesController < ApplicationController

  before_filter :signed_in_user


  def new
    @link = Link.new()
  end

  def create
    @link = Link.new(params[:link])
    if @link.save and current_user.linkages.create(link_id: @link.id)

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
    @linkages = current_user.linkages.find(ordered_linkages)

    @linkages.each do |item|

      item.update_attributes!({order: ordered_linkages.index(item.id.to_s)+1}
                              .reject{|k,v| v.blank?})

      #item.order = ordered_linkages.index(item.id.to_s)+1
    end

    logger.debug "#{@linkages}"

    #@linkages.update_all

    respond_to do |format|
      format.all {
        redirect_to root_path
      }
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
