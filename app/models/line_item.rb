class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order, optional: true

  # LOGIC
  def total_price
    total_price = 0
    if self.quantity >= 3
      if self.product.code == "SR1"
        total_price = self.quantity * self.product.discount_price
      end
      if self.product.code == "CF1"
        total_price = self.quantity * self.product.price*2/3
      end
      if self.product.code == "GR1"
        total_price = self.quantity * self.product.price
      end
    else
      total_price =self.quantity * self.product.price
    end
    return total_price
  end
end