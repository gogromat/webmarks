module StaticPagesHelper

  def icon_set(icon_class, options = {text: '' } )
    options[:other_class] ||= ["icon-white"]
    other_classes = options[:other_class].to_a.join(" ")
    ("<i class='#{icon_class} #{other_classes}'></i> "+options[:text]).to_s.html_safe
  end


end
