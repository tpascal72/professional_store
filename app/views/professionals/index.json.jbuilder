json.array!(@professionals) do |professional|
  json.extract! professional, :id, :fname, :lname, :cost_per_hour, :available, :skills
  json.url professional_url(professional, format: :json)
end
