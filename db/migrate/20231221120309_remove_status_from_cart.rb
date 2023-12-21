class RemoveStatusFromCart < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :status, :string
  end
end
