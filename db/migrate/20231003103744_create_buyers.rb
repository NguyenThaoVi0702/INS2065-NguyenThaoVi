class CreateBuyers < ActiveRecord::Migration[7.0]
  def change
    create_table :buyers do |t|
      t.string :b_id
      t.string :b_name
      t.date :b_dob

      t.timestamps
    end
  end
end
