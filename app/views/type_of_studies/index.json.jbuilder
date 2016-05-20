json.array!(@type_of_studies) do |type_of_study|
  json.extract! type_of_study, :id, :code, :name, :is_valid
  json.url type_of_study_url(type_of_study, format: :json)
end
