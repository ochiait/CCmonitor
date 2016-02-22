# == Schema Information
#
# Table name: students
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  email       :string
#  facebook_id :string
#  zip_code    :string           not null
#  address     :string           not null
#  tel         :string           not null
#  sex         :integer          not null
#  birth_day   :datetime         not null
#  status      :integer          not null
#  memo        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Student < ActiveRecord::Base
  has_secure_password
end
