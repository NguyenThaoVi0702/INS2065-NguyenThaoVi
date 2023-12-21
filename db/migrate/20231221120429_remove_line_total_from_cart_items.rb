class RemoveLineTotalFromCartItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart_items, :line_total, :decimal
  end
end
