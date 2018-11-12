class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :currency, foreign_key: true
      t.references :cashier, foreign_key: true
      t.string :name
      t.integer :value
      t.integer :quantity

      t.timestamps
    end
  end
end
