json.array!(@highschool_completions) do |highschool_completion|
  json.extract! highschool_completion, :id, :code, :name, :is_valid
  json.url highschool_completion_url(highschool_completion, format: :json)
end
