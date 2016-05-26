module ApplicationHelper
  def gravatar_url(email, size = 160)
    "//gravatar.com/avatar/#{Digest::MD5.hexdigest(email.downcase)}.png?s=#{size}&d=wavatar"
  end

  def nav_link_to(text, path)
    options = current_page?(path) ? { class: 'active' } : {}
    content_tag(:li, options) do
      link_to text, path
    end
  end
end
