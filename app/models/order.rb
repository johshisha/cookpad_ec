class Order < ApplicationRecord
  has_many :line_items
  enum status: {
    cart: 0,
    checked_out: 1,
  }

  def total
    sum = 0
    line_items.each do |line_item|
      sum += line_item.quantity * line_item.item.price
    end
  end

  def checkout!(at)
    update!(status: :checked_out, ordered_at: at)
  end

  def into_cart!(at)
    update!(status: :cart, ordered_at: at)
  end
end
