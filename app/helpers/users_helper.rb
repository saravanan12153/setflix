module UsersHelper

  def profile_image_for(user, options={})
    size = options[:size] || 25
    url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}"
    image_tag(url, alt: user.name)
  end
end
