class IndexController < ApplicationController
  def index
    if (!session[:user_id])
      @courses=[]
      return
    end
    @courses = User.find(session[:user_id]).courses
  end

  def login

  end
end