# == Schema Information
#
# Table name: measurement_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :date             not null
#  updated_at :date             not null
#

class MeasurementType < ActiveRecord::Base
  has_many :standard_measurements
  has_many :media_types, through: :standard_measurements
  validates :name, presence: true

end
