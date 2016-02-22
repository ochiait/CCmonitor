class Student::SessionsController < ApplicationController
  def index
    @student = Student.new
  end
  def create
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
