class AddDescriptionToDailyMovement < ActiveRecord::Migration[5.2]
  def change
    add_column :daily_movements, :description, :string
  end
end
