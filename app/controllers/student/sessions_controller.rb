class Student::SessionsController < ApplicationController
  def index
    @student = Student.new
  end
  def create
    if params[:email].nil?
      redirect_to "/" and return
    end
    PostMailer.post_email(params[:email]).deliver
    raise
  end
  def login
    member = Member.find_by_login_name params[:name]
    if member && member.authenticate(params[:password])
        render :text => "Login OK"
    else
        render :text => "Login NG"
    end
end
end
