# == Schema Information
#
# Table name: sal.sample_to_measure
#
#  s2m_id    :integer          not null, primary key
#  sample_id :integer          not null
#  media_id  :integer          not null
#  expired   :integer          default(0), not null
#  whoadded  :string(240)      not null
#  whenadded :date             not null
#

class SampleToMeasure < ActiveRecord::Base

  self.table_name = "sal.sample_to_measure"
  self.primary_key = "s2m_id"

  default_scope ->{ where(expired: 0) }

  belongs_to :sample
  belongs_to :medium_id, class_name: "Medium", foreign_key: "media_id"

end
