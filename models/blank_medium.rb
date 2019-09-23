# == Schema Information
#
# Table name: blank_media
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BlankMedium < ActiveRecord::Base

    belongs_to :blank_procedure
    belongs_to :media_type
    has_many :blank_measurements
  
    scope :not_expired, ->{ where(expired: 0) }
  
    validates :blank_procedure_id, :media_type_id,
      presence: true
  end
