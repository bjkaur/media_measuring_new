# == Schema Information
#
# Table name: blank_procedures
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :date             not null
#  updated_at :date             not null
#

class BlankProcedure < ActiveRecord::Base

  has_many :blank_media

end
