# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  zip_code   :string           not null
#  address    :string           not null
#  tel        :string           not null
#  URL        :string           not null
#  memo       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
