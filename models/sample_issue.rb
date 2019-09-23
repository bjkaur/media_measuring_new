# == Schema Information
#
# Table name: sal.sample_issue
#
#  sample_issue_id           :integer          not null, primary key
#  sample_sample_id          :integer          not null
#  jobissue_jobissue_id      :integer          not null
#  expired                   :integer          not null
#  subcontrct_subcontract_id :integer
#

class SampleIssue < ActiveRecord::Base

  self.table_name = "sal.sample_issue"
  self.primary_key = "sample_issue_id"

  belongs_to :job_issue, foreign_key: 'jobissue_jobissue_id'
  belongs_to :sample, foreign_key: 'sample_sample_id'

end
