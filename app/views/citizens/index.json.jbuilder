json.array!(@citizens) do |citizen|
  json.extract! citizen, :id, :code, :name, :is_valid
  json.url citizen_url(citizen, format: :json)
end
