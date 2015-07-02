# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

semester_list = [
    [ "Spring 2015", "Mandatory" ],
    [ "Summer 2015", "Optional" ],
    [ "Fall 2015", "Mandatory" ],
    [ "Spring 2016", "Mandatory" ]
]

Semester.delete_all
semester_list.each do |name, type|
  Semester.create!( semester_name: name, semester_type: type )
end

course_list = [
    [ "Algorithm", "CSE1015" ],
    [ "Data Structure", "CSE1010" ],
    [ "Programming language 1", "CSE1000" ],
    [ "Differential Integral", "MAT1025" ]
]
Course.delete_all
course_list.each do |name, no|
  Course.create!( course_name: name, course_no: no )
end


User.create! :email => 'admin@mail.com', :password => '12345678', :password_confirmation => '12345678', :admin => true
User.create! :email => 's1@mail.com', :password => '12345678', :password_confirmation => '12345678', :admin => false
User.create! :email => 's2@mail.com', :password => '12345678', :password_confirmation => '12345678', :admin => false
User.create! :email => 's3@mail.com', :password => '12345678', :password_confirmation => '12345678', :admin => false

Register.create!(user_id: 2, course_id: 1, semester_id: 1, cgpa: 3.50)
Register.create!(user_id: 3, course_id: 2, semester_id: 1, cgpa: 3.45)
Register.create!(user_id: 4, course_id: 3, semester_id: 2, cgpa: 3.65)
Register.create!(user_id: 4, course_id: 2, semester_id: 1, cgpa: 3.33)
