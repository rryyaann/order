json.array!(@buys) do |buy|
  json.extract! buy, :id, :address, :city, :state
  json.url buy_url(buy, format: :json)
end
