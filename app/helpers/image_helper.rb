module ImageHelper

  def get_images_path
    "app/assets/images/"
  end

  def add_website_image(link)
    script_path    = 'lib/assets/phantomjs/rasterize.js'
    website        = add_http(link.uri)
    image_path     = "#{get_images_path}links/#{link.id}"
    image          = 'output.png'
   #phantomjs      = `#{phantomjs_path}phantomjs.exe #{phantomjs_path}rasterize.js #{website} #{image_path}/#{image}`
    phantomjs      = `phantomjs #{script_path} #{website} #{image_path}/#{image}`
  end

  def get_website_path_and_image(link, absolute = true, big_image = true)
    path  = ''
    image = ''
    absolute ? path << get_images_path : ''
    path << "links/#{link.id}"
    big_image ? image << "output.png" : image << "resized.png"
    { path: path, image: image }
  end

  def get_website_image_tag(link)
    path_and_image = get_website_path_and_image(link, false, false)
    file_path = "#{path_and_image[:path]}/#{path_and_image[:image]}"

    if file_path && File.exists?(get_images_path+file_path)
      image_tag file_path, class: "screenshot"
    else
      image_tag "links/no_image.png", class: "screenshot"
    end
  end


  def resize_website_image(args = {})
    #convert alpineelements2.png -crop 1024x768+0+0 -resize 400x300 resized.png
    path  = args[:path]
    image = args[:image] || 'output.png'
    !path.blank? ? path << '/' : ''
    #path.prepend('app/assets/images/')
    begin
      require "RMagick"
      source = Magick::Image.read("#{path}#{image}").first
      source = source.crop(0,0,1024,768)
      source = source.resize(400,300)
      source.write("#{path}resized.png")
    rescue Magick::ImageMagickError
      logger.error "Error: #{$!} \n"
      logger.error "#{$0}: ImageMagickError - #{$!}"
    end
  end


end