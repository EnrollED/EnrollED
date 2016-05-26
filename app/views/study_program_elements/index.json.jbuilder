json.array!(@study_program_elements) do |study_program_element|
  json.extract! study_program_element, :id
  json.url study_program_element_url(study_program_element, format: :json)
end
