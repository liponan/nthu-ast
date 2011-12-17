# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :set_user

  protected
    def set_user
      @user = User.find(session[:id]) if @user.nil? && session[:id]
    end

    def login_required
      return true if @user
      access_denied
      return false
    end
    
    def admin_only
      return true if @user and @user.power <= 1
      user_denied
      return false
    end

    def user_denied
      session[:return_to] = request.request_uri
      flash[:error] = 'Ooooop!. You must to be a admin to do this.' 
      redirect_to :controller => 'user', :action => 'login'
    end

    def access_denied
      session[:return_to] = request.request_uri
      flash[:error] = 'E-mail 或密碼輸入錯了嗎？再試一次吧！' 
      redirect_to :controller => 'user', :action => 'login'
    end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def days(year, month)
    case month
    when 1,3,5,7,8,10,12
      31
    when 4,6,9,11
      30
    else
      if Date.leap?(year)
        29
      else
        28
      end # if...else
    end # case...when
  end # def days
end
