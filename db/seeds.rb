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
