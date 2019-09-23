class CreateJoinTableStandardMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_join_table :media_types, :measurement_names do |t|
      t.index [:media_type_id, :measurement_name_id]
      t.index [:measurement_name_id, :media_type_id]
    end
  end
end
