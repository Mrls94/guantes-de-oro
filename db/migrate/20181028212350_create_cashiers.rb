class CreateCashiers < ActiveRecord::Migration[5.2]
  def change
    create_table :cashiers do |t|
      t.string :name
      t.string :place
      t.string :concept
      t.string :comment

      t.timestamps
    end
  end
end
