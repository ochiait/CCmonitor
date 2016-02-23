class PostMailer < ApplicationMailer
  default from: "ochiai@ryorika-mm.jp"
  def post_email(email)
    mail to: email, subject: "登録ありがとうございます"
  end
end
