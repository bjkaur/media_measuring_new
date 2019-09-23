# == Schema Information
#
# Table name: media_type_suite_items
#
#  id                  :integer          not null, primary key
#  media_type_id       :integer
#  media_type_suite_id :integer
#  created_at          :date             not null
#  updated_at          :date             not null
#

class MediaTypeSuiteItem < ActiveRecord::Base
  belongs_to :media_type
  belongs_to :media_type_suite
end
