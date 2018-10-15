
class ApplicationController < ActionController::Base
  before_action :require_login
  include ApplicationHelper
  def require_login
    if !is_login(session) && !is_before_login(request)
      redirect_to :login_path
    end

  end
end
