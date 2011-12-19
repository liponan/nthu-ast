# encoding: utf-8
class AdminController < ApplicationController
 before_filter :admin_only
  def index
  end
  def club_activities
  end
  def list
    @order = params[:order]
    @programs = Program.find(:all, :order=>@order)
  end
  def qualify
    @programs = Program.find(:all, :conditions=>"event_status_id = 0", :order=>"date")
  end
  def edit_program
    @program = Program.find_by_pid(params[:pid])
    if request.post? and @program.update_attributes(params[:program])
      flash[:message] = "借用申請更新成功！"
      redirect_to(:action=>"list")
    end
  end
  def faq
    @faq = Faq.new(params[:faq])
    @faqs = Faq.all
    if request.post? #and faq.save
      @faq.user_id = @user.id
      @faq.save
      flash[:message] = "FAQ成功新增！"
      redirect_to(:action=>:faq)
    end
  end
  def edit_faq
    @faq = Faq.find(params[:id])
    if request.post? and @faq.update_attributes(params[:faq])
      flash[:message] = "FAQ更新成功！"
      redirect_to(:action=>"faq")
    end
  end
end
