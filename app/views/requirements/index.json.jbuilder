json.array!(@requirements) do |requirement|
  json.extract! requirement, :id, :study_program_id, :highschool_completion_id, :profession_id
  json.url requirement_url(requirement, format: :json)
end
