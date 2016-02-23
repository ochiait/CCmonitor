class Student::SessionsController < ApplicationController
  def index
    @student = Student.new
  end
  def create
    if params[:email].nil?
      redirect_to "/" and return
    end
    @student_tmp = StudentTmp.new({email: params[:email]})
    @student_tmp.save
    PostMailer.post_email(@student_tmp).deliver

    redirect_to "/" and return
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
