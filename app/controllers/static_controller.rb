class StaticController < ApplicationController
  def index
    @email = params[:email]
  end
end
