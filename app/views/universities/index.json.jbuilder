json.array!(@universities) do |university|
  json.extract! university, :id, :code, :name, :is_valid
  json.url university_url(university, format: :json)
end
