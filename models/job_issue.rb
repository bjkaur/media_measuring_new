# == Schema Information
#
# Table name: sal.jobissue
#
#  jobissue_id                :integer          not null, primary key
#  com_branch_id              :integer          not null
#  date_logged_in             :date             not null
#  logged_in_by               :string(240)      not null
#  inspected_by               :string(240)      not null
#  invoiced                   :integer
#  issue_number               :decimal(, )      not null
#  number_of_samples_expected :decimal(, )      not null
#  customer_purchase_order    :string(240)
#  customer_reference         :string(240)
#  notes                      :string(1000)
#  project_site               :string(240)
#  reason_for_modifications   :string(240)
#  report_due                 :date             not null
#  turn_around_time           :decimal(, )
#  job_job_id                 :integer          not null
#  current_state              :integer
#  invoiced_value             :decimal(, )
#  invoiced_premium           :decimal(, )
#  expected_value             :decimal(, )
#  expected_premium           :decimal(, )
#  cntct_contact_id           :integer
#  jsn_state_id               :integer
#  analysis_due               :date
#  project_id                 :string(240)
#

class JobIssue < ActiveRecord::Base

  self.table_name = "sal.jobissue"
  self.primary_key = "jobissue_id"

  has_many :sample_issues, foreign_key: 'jobissue_jobissue_id'
  has_one :job, foreign_key: 'current_issue'

end
