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

  def emoticon
    eyes  = [":","8","=",";","X"]
    nose  = ["","-",">"]
    smile = [")","p","D","D","}"]
    eyes[rand(4)]+nose[rand(2)]+smile[rand(4)]
  end

  def add_http(link)
  	link.match(/^www.|^[a-zA-Z0-9]+.[a-zA-Z]+$/) ? link.prepend('http://') : link
  end


end
