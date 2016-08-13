class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.create!.tap do |o|
      o.status = :checked_out
      o.save
    end

    params[:line_items].each do |item|
      order.line_items.create!(item.permit(:item_id, :quantity))
    end
    @orders = Order.find(order.id)
    binding.pry
    render :status=> 201, :formats => [:json]
  end

  def update
    @order = Order.find(params[:id])
    if params.dig(:order, :status) == 'checked_out'
      @order.checkout!(Time.now)
      session.delete(:current_order_id)

      redirect_to @order
    else
      head(:bad_request)
    end
  end
end
