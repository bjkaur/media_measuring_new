# == Schema Information
#
# Table name: media_suites
#
#  id                  :integer          not null, primary key
#  media_type_suite_id :integer
#  created_at          :date             not null
#  updated_at          :date             not null
#  printed_at          :date
#  stock_batch_id      :integer
#

class MediaSuite < ActiveRecord::Base
  belongs_to :media_type_suite

  has_many :media_suite_items
  has_many :order_media_suites
  has_many :media,
    ->{ order("media.id") },
    through: :media_suite_items
end
