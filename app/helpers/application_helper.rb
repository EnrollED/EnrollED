module ApplicationHelper
  def gravatar_url(email, size = 160)
    "//gravatar.com/avatar/#{Digest::MD5.hexdigest(email.downcase)}.png?s=#{size}&d=wavatar"
  end
end
