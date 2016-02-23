# == Schema Information
#
# Table name: student_tmps
#
#  id          :integer          not null, primary key
#  email       :string           not null
#  facebook_id :string
#  lifetime    :integer          not null
#  key         :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class StudentTmp < ActiveRecord::Base
end
