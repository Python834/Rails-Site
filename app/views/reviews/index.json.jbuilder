json.array!(@reviews) do |review|
  json.extract! review, :id, :title, :author, :opinion, :rating, :thumbnail
  json.url review_url(review, format: :json)
end
