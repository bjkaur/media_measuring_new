class CreateStandardMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :standard_measurements do |t|
      t.references :media_type
      t.references :measurement_name

      t.timestamps
    end
  end
end
