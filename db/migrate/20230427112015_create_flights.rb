class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :from
      t.string :to
      t.string :passenger
      t.string :class_type
      t.timestamps
    end
  end
end
