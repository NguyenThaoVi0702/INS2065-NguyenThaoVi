class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :name
      t.string :image
      t.decimal :price
      t.decimal :discount
      t.text :description
      t.boolean :available

      t.timestamps
    end
  end
end
