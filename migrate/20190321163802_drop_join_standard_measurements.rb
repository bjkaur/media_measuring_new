class DropJoinStandardMeasurements < ActiveRecord::Migration[5.2]
  def change
    drop_table :join_standard_measurements 
  end
end
