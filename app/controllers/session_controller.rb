class SessionController < ApplicationController
  def new

  end

  def login
    user = User.where({email: params[:user][:email]}).first
    if user && user.authenticate(params[:user][:password])
      session[:userid] = user[:id]
      redirect_to "/"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def delete
    session[:userid] = nil
    redirect_to :login_path
  end
end