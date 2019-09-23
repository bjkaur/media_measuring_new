# == Schema Information
#
# Table name: media_types
#
#  id                   :integer          not null, primary key
#  measurement_suite_id :integer
#  name                 :string(255)
#  expired              :integer          default(0)
#  created_at           :date             not null
#  updated_at           :date             not null
#  hidden               :integer          default(0)
#

class MediaType < ActiveRecord::Base

  belongs_to :measurement_suite

  has_many :media
  has_many :stock_batches
  has_many :standard_measurements
  has_many :measurement_types, through: :standard_measurements
  has_many :media_order_requests

  scope :active, ->{ where(expired: 0) }
  scope :by_name, ->{ order(:name) }

  scope :by_name, ->{ order(:name) }
  scope :not_hidden, ->{  where(hidden: 0) }

end
