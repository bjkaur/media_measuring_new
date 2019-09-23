class DropBlankMedia < ActiveRecord::Migration[5.2]
  def up
    drop_table :blank_media
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end 
