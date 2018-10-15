class SessionController < ApplicationController
  def new

  end

  def login
    user = User.where({email: params[:user][:email]}).first
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user[:id]
      redirect_to "/"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to :login_path
  end
end