# == Schema Information
#
# Table name: suite_measurements
#
#  id                   :integer          not null, primary key
#  measurement_suite_id :integer
#  measurement_name_id  :integer
#  position             :integer
#  repeatable           :integer
#  created_at           :date             not null
#  updated_at           :date             not null
#  expired_at           :date
#

class SuiteMeasurement < ActiveRecord::Base
  belongs_to :measurement_suite
  belongs_to :measurement_name

  validates :measurement_suite, :measurement_name, presence: true

  scope :ordered, ->{ order(:position) }
end
