class UserController < ApplicationController
  before_filter :login_required, :except => [:login, :loggingin, :sign_up, :profile] 
  def login
    @user = User.new
    #@user.userid = params[:userid]
  end
  
  def loggingin
    if user = User.authenticate(params[:user])
      session[:id] = user.id # Remember the user's id during this session 
      redirect_to session[:return_to] || '/'
    else
      flash[:error] = 'Invalid login.' 
      redirect_to :action => 'login', :username => params[:email][:username]
    end
  end
  def logout
    reset_session
    flash[:message] = "You've sucesffully logged out."
    redirect_to :action => "login"
  end

  def sign_up
    @user = User.new(params[:user])
    
    if request.post?
      # @user = User.new
      @user.userid = @user.email.tr("@","-at-").tr(".","-")
      @user.save
      session[:id] = @user.id
      flash[:notice] = '註冊完成！感謝您的填寫。'
      redirect_to(:controller=>:user, :action =>:profile)
    end
  end
  def create

  end
  def profile
    #@user = User.find(params[:id])
  end
  def edit_profile
    if request.post? and @user.update_attributes(params[:user])
      flash[:message] = "個人資料已經更新！"
      redirect_to (:action => "profile")
    end
  end
  def records
    @programs = @user.programs
    
  end
end
