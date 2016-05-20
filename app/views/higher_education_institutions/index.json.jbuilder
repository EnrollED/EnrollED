json.array!(@higher_education_institutions) do |higher_education_institution|
  json.extract! higher_education_institution, :id, :code, :name, :acronym
  json.url higher_education_institution_url(higher_education_institution, format: :json)
end
