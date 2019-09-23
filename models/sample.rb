# == Schema Information
#
# Table name: sal.samples
#
#  sample_id                :integer          not null, primary key
#  storage                  :integer          not null
#  customer_ref             :string(240)
#  condition_of_sample      :string(240)
#  on_hold                  :integer          not null
#  combined_sample          :integer
#  sample_sample_id         :integer
#  suite_suite_id           :integer
#  expired                  :integer          not null
#  sample_number            :decimal(, )      not null
#  actioner                 :string(240)
#  when_created             :date
#  testnname_string         :string(2000)
#  storage_x                :string(4)
#  storage_y                :integer
#  customer_depth           :string(240)
#  customer_location        :string(240)
#  trivialmat_trivial_id    :integer          not null
#  leachate_parent          :integer
#  extraction_extraction_id :integer
#  northing                 :string(240)
#  sampled_date             :date
#  sampler                  :string(240)
#  easting                  :string(240)
#  client_class             :integer
#  our_class                :integer
#  wind_wind_id             :integer
#  outlook_outlook_id       :integer
#  sampletype_type_id       :integer
#  elevation                :string(240)
#  sample_view_id           :integer
#

class Sample < ActiveRecord::Base

  self.table_name = "sal.samples"
  self.primary_key = "sample_id"

  has_many :sample_issues, foreign_key: 'sample_sample_id'
  has_many :job_issues, through: :sample_issues

end
