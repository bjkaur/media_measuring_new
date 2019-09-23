# == Schema Information
#
# Table name: measurement_names
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  measurement_type_id     :integer
#  expired                 :integer          default(0)
#  created_at              :date             not null
#  updated_at              :date             not null
#  mark_medium_as_returned :integer          default(0)
#  position                :integer
#

class MeasurementName < ActiveRecord::Base
  #belongs_to :measurement_type

  #has_many :suite_measurements
  has_many :measurement_suites, through: :suite_measurements
  has_many :measurements
  has_many :standard_measurements

  validates :name, :measurement_type_id, presence: true

  validates :name, uniqueness:{scope: :expired}, unless: :expired?

  scope :active, ->{ where(expired: 0) }

end
