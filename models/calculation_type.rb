# == Schema Information
#
# Table name: calculation_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type       :string(255)
#  created_at :date             not null
#  updated_at :date             not null
#

class CalculationType < ActiveRecord::Base
  
  has_many :measurement_suites

end
