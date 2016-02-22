class PostMailer < ApplicationMailer
  default from: "ochiai@ryorika-mm.jp"
    def post_email
    mail to: 'hjdrr327@yahoo.co.jp', subject: "登録ありがとうございます"
  end
end
