class CreateBlankMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :blank_media do |t|

      t.timestamps
    end
  end
end
