class AddValueColombiaToCashier < ActiveRecord::Migration[5.2]
  def change
    add_column :cashiers, :value_colombia, :integer, default: 0
  end
end
