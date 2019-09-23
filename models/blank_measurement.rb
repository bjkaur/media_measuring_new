# == Schema Information
#
# Table name: blank_measurements
#
#  id         :integer          not null, primary key
#  created_at :date             not null
#  updated_at :date             not null
#  weight1a   :float
#  weight2a   :float
#  weight3a   :float
#  weight1b   :float
#  weight1c   :float
#  weight2b   :float
#  weight2c   :float
#  weight3b   :float
#  weight3c   :float
#

class BlankMeasurement < ActiveRecord::Base
  #belongs_to :blank_medium
  #belongs_to :equipment
  #belongs_to :contact, class_name: "Contact", foreign_key: "contact_id"
end
