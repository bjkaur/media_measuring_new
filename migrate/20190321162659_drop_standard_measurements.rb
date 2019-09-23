class DropStandardMeasurements < ActiveRecord::Migration[5.2]
  def change
    drop_table :standard_measurements 
  end
end
