# == Schema Information
#
# Table name: media
#
#  id                 :integer          not null, primary key
#  media_type_id      :integer
#  expiration_date_on :date
#  created_at         :date             not null
#  updated_at         :date             not null
#  returned_by_client :integer          default(0)
#  printed_at         :date
#  stock_batch_id     :integer
#

class Medium < ActiveRecord::Base

  include BarcodesHelper

  attr_accessor :medium_qty

  belongs_to :stock_batch
  belongs_to :media_type
  has_many :measurements
  #has_many :order_media
  #has_one :order_medium
  #has_one :order, through: :order_medium
  has_many :active_measurements, #BK: dont need it like this 
    ->{ where(expired: 0) },
    class_name: "Measurement",
    foreign_key: "medium_id"
  has_one :media_suite_item

  scope :for_job_number, ->(job_number){
    select("distinct media.*").
    where(:jobs => {job_id: job_number})
  }

  has_one :sample_to_measure, foreign_key: "media_id"
  has_one :sample, through: :sample_to_measure

  has_many :media_suite_items

  def single_medium(medium, copies)
    code(medium.name, medium.expiration_date_on, medium.barcode, medium.barcode_hint, copies, medium.media_type.measurement_suite.short)
  end

end
