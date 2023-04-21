class CreateCarbonimpacts < ActiveRecord::Migration[7.0]
  def change
    create_table :carbonimpacts do |t|
      t.string :fuel_type
      t.string :power_source
      t.timestamps 
    end
  end
end
