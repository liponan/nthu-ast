# encoding: utf-8
class ItemsController < ApplicationController
  def new
    @item = Item.new(params[:item])
    if request.post? and @item.save
      @item = Item.new
      flash[:notice] = '註冊完成！感謝您的填寫。'
      redirect_to(:controller=>:items, :action =>:new)
    end
  end
end
