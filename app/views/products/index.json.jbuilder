json.array!(@products) do |product|
  json.extract! product, :id, :name, :model, :seller, :price, :picture, :description
  json.url product_url(product, format: :json)
end
