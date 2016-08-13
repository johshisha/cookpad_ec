json.extract! @orders, :id, :ordered_at,\
  :status, :created_at, :updated_at
#binding.pry
json.url order_url(@orders)
json.array(@orders.line_items) do |line_items|
  json.extract! line_items, :quantity, :subtotal
  #binding.pry
  item = line_items.item
  json.item do
    json.extract! item, :id, :name, :price
    json.url item_url(item, format: :json)
  end
end
