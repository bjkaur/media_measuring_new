# == Schema Information
#
# Table name: standard_measurements
#
#  id                  :integer          not null, primary key
#  media_type_id       :integer
#  measurement_name_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class StandardMeasurement < ApplicationRecord
  belongs_to :media_type
  belongs_to :measurement_name
end
