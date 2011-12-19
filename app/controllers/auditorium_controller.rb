# encoding: utf-8
class AuditoriumController < ApplicationController
  before_filter :login_required
  def index
  end
  def query
    @date = params[:date]
    @date2 = Date.parse(@date)
    if (@date2 - Time.now.to_date) < 7
      flash[:message] = "查詢的日期已無法預約。"
      redirect_to(:action=>"query_by_month")
    end
    @check = 0
    @programs = Program.find_all_by_date(@date, :order=>"block_1, block_2, block_3")
    for p in @programs
      @check = @check + p.block_1 + p.block_2 + p.block_3
    end 
  end
  def query_by_month
    @weekdays = ['日', '一', '二', '三', '四', '五', '六']
    @year = params[:year].to_i
    @month = params[:month].to_i
    if @month==13
      @month = 1
      @year = @year + 1
    end
    if @month==0
      @month = 12
      @year = @year - 1
    end
    if @year < Time.now.year or (@year==Time.now.year and @month <= Time.now.month)
      flash[:message] = "您輸入的月份為當前月份或者過往月份，不開放預約。"
      redirect_to(:action=>"query_by_month", :year=>Time.now.year, :month=>Time.now.month+1)
    end
    @days = days(@year, @month)
  end
  def reserve
    @page_title = '預約合勤廳'
    @date = params[:date]
    @p = Program.find_all_by_date(@date)
    @checks = [0, 0, 0]
    for p in @p
      @checks[0] = @checks[0] + p.block_1
      @checks[1] = @checks[1] + p.block_2
      @checks[2] = @checks[2] + p.block_3
    end
    @program = Program.new(params[:program])
    @contact = Contact.new(params[:contact])
    @club_activity = ClubActivity.create(:club=>'F')
    @contact.user = @user
    @program.contact = @contact
    @program.club_activity = @club_activity
    if request.post? and @program.save
      redirect_to(:action=>:blocks, :pid=>@program.pid)
    end
  end
  def blocks
    @pid = params[:pid]
    @program = Program.find_by_pid(@pid)
    @blocks = @program.blocks
    @block = Block.new(params[:block])
    if request.post? 
      @program.blocks << @block
      redirect_to(:action=>:blocks  )
    end
  end
    def items
      @pid = params[:pid]
      @program = Program.find_by_pid(@pid)
      @items = Item.all
      @program_items = @program.program_items
      @program_item = ProgramItem.new(params[:program_item])
      if request.post? 
        @program.program_items << @program_item
        redirect_to(:action=>:items)
      end
    end
    def add_item
      @item = Item.find(params[:id])
      @program = Program.find_by_pid(params[:pid])
      @program_item = ProgramItem.create(:name=>@item.name)
      @program.program_items << @program_item
      redirect_to(:action=>:items, :pid=>@program.pid)
    end
  def receipt
    @program = Program.find_by_pid(params[:pid])
    check_owner(@program.user)
  end
  def edit_program
    @program = Program.find_by_pid(params[:pid])
    check_owner(@program.user)
    if request.post? and @program.update_attributes(params[:program])
      flash[:message] = "借用申請更新成功！"
      redirect_to(:action=>"records")
    end
  end
  
  def available(date)
    @range = 30
    @up_bound = '2012-07-31'
    return false if (Date.parse(date).jd - Time.now.to_date.jd) < @range
    return false if Date.parse(date).jd > Date.parse(@up_bound).jd
  end
  def on_day(date)
    @programs = Progream.find_by_date(date)
    @check = 0
    for p in @programs
      @check = p.block_1 + p.block_2 + p.block_3
    end
    return @check
  end
  
end
