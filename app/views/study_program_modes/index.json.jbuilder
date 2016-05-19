json.array!(@study_program_modes) do |study_program_mode|
  json.extract! study_program_mode, :id
  json.url study_program_mode_url(study_program_mode, format: :json)
end
