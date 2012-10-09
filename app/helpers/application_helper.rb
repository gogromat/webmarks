module ApplicationHelper

	def full_title(page_title)
		base_title = "Webmarks"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

  def flash_display
    response = ''
    flash.each do |name, msg|
      response = response + content_tag(:div, msg, :class => "alert alert-#{name}")
    end
    flash.discard
    response
  end


end
