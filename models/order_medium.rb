# == Schema Information
#
# Table name: order_media
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  medium_id  :integer
#  created_at :date             not null
#  updated_at :date             not null
#

class OrderMedium < ActiveRecord::Base
  belongs_to :order
  belongs_to :medium
end
