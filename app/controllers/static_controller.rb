class StaticController < ApplicationController
  def index
    @email = params[:email]
    PostMailer.post_email.deliver
  end
end
