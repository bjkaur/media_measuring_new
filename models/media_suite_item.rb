# == Schema Information
#
# Table name: media_suite_items
#
#  id             :integer          not null, primary key
#  media_suite_id :integer
#  medium_id      :integer
#  created_at     :date             not null
#  updated_at     :date             not null
#

class MediaSuiteItem < ActiveRecord::Base
  belongs_to :media_suite
  belongs_to :medium
end
