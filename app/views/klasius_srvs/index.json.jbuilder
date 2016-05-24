json.array!(@klasius_srvs) do |klasius_srv|
  json.extract! klasius_srv, :id, :id, :code, :description__sl, :description_en, :parent, :level, :is_valid
  json.url klasius_srv_url(klasius_srv, format: :json)
end
