json.array!(@professions) do |profession|
  json.extract! profession, :id, :code, :name, :is_valid
  json.url profession_url(profession, format: :json)
end
