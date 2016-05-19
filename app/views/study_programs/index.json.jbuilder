json.array!(@study_programs) do |study_program|
  json.extract! study_program, :id
  json.url study_program_url(study_program, format: :json)
end
