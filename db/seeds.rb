# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
admin = User.new(:login => "admin", :email => "admin@example.com", :password => "adminadmin", :password_confirmation => 'adminadmin')
admin.save

# Meeting & Presentation Examples:
 itrc27_meeting = Meeting.create(:name => 'ITRC meet27', :start_date => Time.local(2010, 5, 21, 9, 30), :end_date => Time.local(2010, 5, 21, 10, 30))
presentation01 = Presentation.create(:meeting => itrc27_meeting, :speaker => '発表者氏名(1)', :collaborator => '共同研究者1(2)，共同研究者2(2)', :affiliation => '(1) XX大学 (2) XX株式会社', :title => 'XXに関する研究')
