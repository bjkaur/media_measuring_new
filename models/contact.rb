# == Schema Information
#
# Table name: sal.contacts
#
#  contact_id             :integer          not null, primary key
#  email                  :string(240)
#  fax                    :string(240)
#  phone                  :string(240)
#  role                   :string(240)
#  expired                :integer          not null
#  com_branch_id          :integer          not null
#  person_person_id       :integer          not null
#  mobile                 :string(240)
#  createdby              :string(240)      not null
#  datecreated            :date
#  default_report_to      :integer
#  default_invoice_to     :integer
#  extension              :string(240)
#  general_state_state_id :integer
#

class Contact < ActiveRecord::Base
  self.table_name = 'sal.contacts'
  self.primary_key = 'contact_id'

  belongs_to :company_branch,
             foreign_key: 'com_branch_id',
             class_name: 'CompanyBranch'
  belongs_to :person, foreign_key: 'person_person_id'

end
