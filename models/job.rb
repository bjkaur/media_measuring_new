# == Schema Information
#
# Table name: sal.jobs
#
#  job_job_id          :integer
#  quote_quote_id      :integer          not null
#  job_id              :integer          not null, primary key
#  invoice_to          :integer
#  report_to           :integer
#  dispatch_report_to  :integer
#  dispatch_invoice_to :integer
#  priority            :integer
#  current_issue       :integer
#  salesman_id         :integer
#  duration_offset     :decimal(, )
#

class Job < ActiveRecord::Base

  self.table_name = "sal.jobs"
  self.primary_key = "job_id"

end
