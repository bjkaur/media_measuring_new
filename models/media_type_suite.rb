# == Schema Information
#
# Table name: media_type_suites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  expired    :integer          default(0)
#  created_at :date             not null
#  updated_at :date             not null
#

class MediaTypeSuite < ActiveRecord::Base

  has_many :media_type_suite_items
  has_many :media_types, through: :media_type_suite_items

  validates :name , presence: true

  scope :active, ->{ where(expired: 0) }

end
