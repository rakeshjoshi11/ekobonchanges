class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.string :project_name
      t.string :carbonoffset
      t.string :offsetamount
      t.string :transaction_id
      t.string :partner_id
      t.timestamps
    end
  end
end
