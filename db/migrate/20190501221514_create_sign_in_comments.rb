class CreateSignInComments < ActiveRecord::Migration[5.2]
  def change
    create_table :sign_in_comments do |t|
      t.references :user, foreign_key: true
      t.string :comment
      t.references :cashier, foreign_key: true
      t.json :cashier_currency_values
      t.boolean :anomaly

      t.timestamps
    end
  end
end
