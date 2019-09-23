# == Schema Information
#
# Table name: stock_batches
#
#  id                  :integer          not null, primary key
#  username            :string(255)
#  created_at          :date             not null
#  updated_at          :date             not null
#  media_type_id       :integer
#  media_type_suite_id :integer
#  item_count          :integer          default(0)
#  lot_number          :string(255)
#  stock_expired       :boolean          default(FALSE), not null
#

class StockBatch < ActiveRecord::Base

  has_many :media
  has_many :media_suites
  belongs_to :media_type
 # belongs_to :media_type_suite 

end
 
