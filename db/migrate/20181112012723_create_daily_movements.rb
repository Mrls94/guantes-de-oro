class CreateDailyMovements < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_movements do |t|
      t.references :user, foreign_key: true
      t.references :currency, foreign_key: true
      t.integer :action
      t.integer :value_foreign
      t.integer :value_colombia
      t.integer :exchange_rate

      t.timestamps
    end
  end
end
