# == Schema Information
#
# Table name: media_order_requests
#
#  id            :integer          not null, primary key
#  quantity      :integer
#  media_type_id :integer
#  order_id      :integer
#  created_at    :date             not null
#  updated_at    :date             not null
#

class MediaOrderRequest < ActiveRecord::Base
  belongs_to :media_type
  belongs_to :order

end 
 
