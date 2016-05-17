json.array!(@posts) do |post|
  json.extract! post, :id, :code, :name, :is_valid
  json.url post_url(post, format: :json)
end
