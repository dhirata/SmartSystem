json.array!(@smarties) do |smarty|
  json.extract! smarty, :id
  json.url smarty_url(smarty, format: :json)
end
