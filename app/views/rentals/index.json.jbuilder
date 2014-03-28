json.array!(@rentals) do |rental|
  json.extract! rental, :id, :amount, :start_date, :end_date
  json.url rental_url(rental, format: :json)
end
