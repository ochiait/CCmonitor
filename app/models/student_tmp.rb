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

require 'digest/md5'
class StudentTmp < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  before_save {
    self.lifetime = generate_lifetime
    self.key = generate_key
  }

  private
    # save時にlifetime作成する
    def generate_lifetime
      # 期限は1時間
      Time.now.to_i + 3600
    end

    # save時にkeyを作成する
    def generate_key
      raise "メールアドレスが指定されていません" if self.email.blank?
      str = Time.now.to_s + self.email
      Digest::MD5.hexdigest(str + 'ccmonitor')
    end

end
