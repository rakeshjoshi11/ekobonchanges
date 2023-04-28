class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :project_name
      t.string :carbonoffset
      t.string :offsetamount
      t.string :partner_id
      t.string :transaction_id
      t.string :distribution
      t.timestamps
    end
  end
end
