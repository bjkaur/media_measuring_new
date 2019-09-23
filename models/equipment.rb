# == Schema Information
#
# Table name: sal.equipment
#
#  equipment_id                 :integer          not null, primary key
#  name                         :string(240)      not null
#  date_installed               :date             not null
#  serial_number                :string(240)
#  expired                      :integer          not null
#  tequipment_equipment_type_id :integer
#  purchase_date                :date
#  previous_owner               :string(240)
#  most_recent_change           :integer
#

class Equipment < ActiveRecord::Base

  self.table_name = "sal.equipment"
  self.primary_key = "equipment_id"

  has_many :blank_measurements
  has_many :measurements
end
