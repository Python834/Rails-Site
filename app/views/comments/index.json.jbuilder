json.array!(@comments) do |comment|
  json.extract! comment, :id, :author, :opinion, :rating, :product_id
  json.url comment_url(comment, format: :json)
end
