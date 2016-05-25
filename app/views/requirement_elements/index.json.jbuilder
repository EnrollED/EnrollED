json.array!(@requirement_elements) do |requirement_element|
  json.extract! requirement_element, :id
  json.url requirement_element_url(requirement_element, format: :json)
end
