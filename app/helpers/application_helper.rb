module ApplicationHelper

  def is_before_login request
    url=request.fullpath.split("\?")[0]
    (url=='/login' || url=='/signup')
  end

  def is_login session
    return session[:userid]
  end
end
