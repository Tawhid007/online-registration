class Course < ActiveRecord::Base
  validates :course_name ,presence: true, length: {maximum: 30}
  validates :course_no ,presence: true, length: {maximum: 10}
end
