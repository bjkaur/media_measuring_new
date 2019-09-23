# == Schema Information
#
# Table name: sal.company_branches
#
#  branch_id                 :integer          not null, primary key
#  name                      :string(240)
#  address                   :string(240)      not null
#  postcode                  :string(240)
#  phone                     :string(240)      not null
#  fax                       :string(240)
#  branch_email              :string(240)
#  default___discount        :decimal(, )
#  expired                   :integer          not null
#  cmpny_company_id          :integer          not null
#  currency_currency_id      :integer
#  supplier_state            :integer
#  customer_state            :integer
#  supplier_account          :string(240)
#  createdby                 :string(240)      not null
#  default_invoice_to        :integer
#  default_report_to         :integer
#  branch_view_id            :integer
#  tacac                     :string(240)
#  default_vat_rate          :decimal(, )
#  general_state_state_id    :integer          default(1)
#  online_invoice_start_date :date
#  datecreated               :date
#  new_date                  :date
#  last_job_date             :date
#  exchequer_code            :string(50)
#  exchequer_vat_code        :string(3)
#  vat_text                  :string(300)
#

class CompanyBranch < ActiveRecord::Base

  self.table_name = "sal.company_branches"
  self.primary_key = "branch_id"

  belongs_to :company, foreign_key: "cmpny_company_id", class_name: "Company"
  belongs_to :latest_company_branch, foreign_key: "branch_view_id", class_name: "CompanyBranch"

end
