json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :quantity, :selling_price, :cost_of_products, :weight, :thumbnail, :full_image
  json.url product_url(product, format: :json)
end
