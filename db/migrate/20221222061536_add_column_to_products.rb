class AddColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :discount_price, :double, default: 4.50
  end
end
