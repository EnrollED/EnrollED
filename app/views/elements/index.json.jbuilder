json.array!(@elements) do |element|
  json.extract! element, :id, :code, :name, :is_valid
  json.url element_url(element, format: :json)
end
