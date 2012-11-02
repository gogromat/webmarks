module StaticPagesHelper

  def icon_set(icon_class, options = {} )
    classes  = options[:other_class] ||= "icon-white"
    ("<i class='#{icon_class} #{classes}'></i> "+options[:text].to_s).to_s.html_safe
  end


end
