class AddSecondColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :image_path, :string, default: "default.png"
  end
end
