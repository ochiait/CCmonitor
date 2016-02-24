class StaticController < ApplicationController
  def index
    @email = params[:email]
  end
  def register
    @student = Student.new
  end
  def thankyou
  end
end
