module UsersHelper

  def gravatar_for(user, options = {size: 50} )
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def user_path_by_email(email)
    user = User.find_by_email(email.downcase)
    if !user.nil?
      link_to user.name, user_path(user)
    else
      email.downcase
    end
  end

end
