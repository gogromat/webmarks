module ImageHelper

  def add_website_image(link)
    phantomjs_path = 'lib/assets/phantomjs/'
    website        = add_http(link.uri)
    image_path     = "app/assets/images/links/#{link.id}"
    image          = 'output.png'
    phantomjs      = `#{phantomjs_path}phantomjs.exe #{phantomjs_path}rasterize.js #{website} #{image_path}/#{image}`
  end

  def get_website_path_and_image(link)
    %w["app/assets/images/links/#{link.id}", "output.png"]
  end

  def resize_website_image(path, image = 'output.png')

    #convert alpineelements2.png -crop 1024x768+0+0 -resize 400x300 resized.png
    !path.empty? ? path << '/' : ''
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