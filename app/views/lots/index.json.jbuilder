json.array!(@lots) do |lot|
  json.extract! lot, :id, :number, :block, :satage, :square_meters, :status, :salesman_id
  json.url lot_url(lot, format: :json)
end
