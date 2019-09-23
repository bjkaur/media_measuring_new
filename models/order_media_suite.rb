# == Schema Information
#
# Table name: order_media_suites
#
#  id             :integer          not null, primary key
#  order_id       :integer
#  media_suite_id :integer
#  created_at     :date             not null
#  updated_at     :date             not null
#

class OrderMediaSuite < ActiveRecord::Base
  belongs_to :order
  belongs_to :media_suite

  validates :order_id, :media_suite_id, presence: true
end
