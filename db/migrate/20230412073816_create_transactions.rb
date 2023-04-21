class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :address
      t.string :city
      t.string :transaction_id
      t.string :token
      t.timestamps
    end
  end
end
