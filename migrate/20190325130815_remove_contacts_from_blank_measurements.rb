class RemoveContactsFromBlankMeasurements < ActiveRecord::Migration[5.2]
  def change
    remove_column :blank_measurements, :contact_id
  end
end
