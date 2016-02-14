json.array!(@twitter_data) do |twitter_datum|
  json.extract! twitter_datum, :id
  json.url twitter_datum_url(twitter_datum, format: :json)
end
