# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


# encoding: utf-8
User.create(:email=>"nthu.ast",:password=>"20050601",:power=>"0")
BlockType.create(:name=>"場佈",:remark=>"佈")
BlockType.create(:name=>"彩排",:remark=>"彩")
BlockType.create(:name=>"演出",:remark=>"演")
EventStatus.create(:name=>"新申請")
EventStatus.create(:name=>"審核中")
EventStatus.create(:name=>"完成登記")
EventStatus.create(:name=>"取消")
EventStatus.create(:name=>"待補件")
