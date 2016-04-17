module ApplicationHelper
  def gravatar_url(user, size)
    "//gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}.png?s=#{size}"
  end
end
