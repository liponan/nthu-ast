# encoding: utf-8
class HomeController < ApplicationController
  def index
  
  end
  def faq
    @faqs = Faq.all
  end
  def auditorium_info
  end
  def ast
  end
  def contact_us
  end
end
