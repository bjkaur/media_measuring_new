# == Schema Information
#
# Table name: measurement_suites
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  default_expiry_days :integer
#  enforce_order       :integer          default(0)
#  created_at          :date             not null
#  updated_at          :date             not null
#  blank_procedure_id  :integer
#  calculation_type_id :integer
#  short               :string(255)
#

class MeasurementSuite < ActiveRecord::Base

  has_many :suite_measurements
  has_many :measurement_names, through: :suite_measurements
  has_many :measurement_types
  has_many :media_types

  belongs_to :blank_procedure
  belongs_to :calculation_type

  validates :name, presence: true

end
