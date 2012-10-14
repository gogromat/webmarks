module LinksHelper

  def url_with_protocol(url)
    /^[a-z]{0,10}:\/\//.match(url) ? url : "http://" << url
  end

end
