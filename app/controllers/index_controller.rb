class IndexController < ApplicationController
  def index
    @courses=User.find(session[:user_id]).courses
  end
  def login

  end
end