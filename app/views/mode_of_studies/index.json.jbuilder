json.array!(@mode_of_studies) do |mode_of_study|
  json.extract! mode_of_study, :id, :code, :name, :isValid
  json.url mode_of_study_url(mode_of_study, format: :json)
end
