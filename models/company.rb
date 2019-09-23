# == Schema Information
#
# Table name: sal.companies
#
#  company_id              :integer          not null, primary key
#  name                    :string(240)      not null
#  customer_number         :string(240)
#  expired                 :integer          not null
#  createdby               :string(240)      not null
#  phoneticname            :string(240)
#  acronym_name            :string(240)
#  default_invoice_to      :integer
#  default_report_to       :integer
#  logo_url                :string(30)
#  short_name              :string(50)
#  showcostonreview        :integer          default(1)
#  waive_minimum_charge    :integer          default(0)
#  waive_disposal_charge   :integer          default(0)
#  dont_email_invoices     :integer          default(0), not null
#  purchase_order_required :integer          default(0)
#  general_state_state_id  :integer
#  datecreated             :date
#  minimum_invoice         :decimal(, )
#  minimum_sample          :decimal(, )
#  priority                :integer
#  payment_required        :integer          default(0)
#  exchequer_location      :string(10)
#  customer_category_id    :integer
#

class Company < ActiveRecord::Base

  self.table_name = "sal.companies"
  self.primary_key = "company_id"

end
