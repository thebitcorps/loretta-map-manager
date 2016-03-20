json.array!(@salesmen) do |salesman|
  json.extract! salesman, :id, :name, :lastname
  json.url salesman_url(salesman, format: :json)
end
