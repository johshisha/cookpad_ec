class LineItemsController < ApplicationController
  def create
    order = Order.create!
    line_item = order.line_items.create!(params.require(:line_item).permit(:item_id, :quantity))
    order.checkout!(Time.now)
    redirect_to order
  end
end
