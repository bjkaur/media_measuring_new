# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  contact_id      :integer
#  request_date_on :date
#  state           :integer          default("creating")
#  created_at      :date             not null
#  updated_at      :date             not null
#  sal_contact_id  :integer
#  stock           :integer          default(0)
#  ticket_number   :string(255)
#

class Order < ActiveRecord::Base

  class CannotModifyOrder < StandardError ; end

  #Added two more states to allow customer request the order and CSAs to authorise it. 
  enum state: {creating: 0, completed: 1, sent: 2, cancelled: 3, requested: 4, authorised: 5}

  # SAL contact logged in
  belongs_to :sal_contact, foreign_key: "sal_contact_id",
    class_name: "Contact"

  # Primary client contact
  belongs_to :contact
  has_many :media_order_requests

  scope :by_date, ->{ order("orders.created_at desc") }
  scope :not_sent, ->{ where("state not in (?)", [2, 3]) }
  scope :sent, ->{ where(state: 2) }
  scope :not_stock, ->{ where("orders.stock != 1") }

  has_many :order_media_suites
  has_many :media_suites, through: :order_media_suites
  has_many :order_media
  has_many :media, through: :order_media
  has_many :orders 

  # A stock order doesn't require these fields
  validates :request_date_on, :contact_id, :sal_contact_id,
    presence: true,
    unless: lambda{|o| o.stock_order? }

  # Find the next medium after the given one in this order

end
