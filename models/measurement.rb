# == Schema Information
#
# Table name: measurements
#
#  id                  :integer          not null, primary key
#  medium_id           :integer
#  contact_id          :integer
#  equipment_id        :integer
#  value               :string(255)
#  created_at          :date             not null
#  updated_at          :date             not null
#  expired             :integer          default(0)
#  measurement_name_id :integer
#

class Measurement < ActiveRecord::Base
  
  include BarcodesHelper

  belongs_to :medium
  belongs_to :measurement_name
  #belongs_to :contact
  #belongs_to :equipment

  scope :active, ->{ where(expired: 0) }

  scope :for_measurement_name,
    ->(id){ where(measurement_name_id: id) }
  
end
