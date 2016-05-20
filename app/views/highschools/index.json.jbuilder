json.array!(@highschools) do |highschool|
  json.extract! highschool, :id, :code, :name, :is_valid
  json.url highschool_url(highschool, format: :json)
end
