# == Schema Information
#
# Table name: sal.people
#
#  person_id           :integer          not null, primary key
#  title               :string(10)
#  firstname           :string(240)
#  middlename          :string(240)
#  surname             :string(240)      not null
#  height              :string(240)
#  weight              :string(240)
#  shoe_size           :decimal(, )
#  mothers_maiden_name :string(240)
#  person_type         :string(10)       not null
#  expired             :integer          not null
#  createdby           :string(240)      not null
#  name_string         :string(240)      not null
#  username            :string(240)
#

class Person < ActiveRecord::Base

  self.table_name = "sal.people"
  self.primary_key = "person_id"

end
