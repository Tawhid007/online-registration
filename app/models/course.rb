class Course < ActiveRecord::Base
  has_many :registrations
  has_many :users, through: :registrations
  has_many :semesters, through: :registrations

  validates :course_name ,presence: true, length: {maximum: 30}
  validates :course_no ,presence: true, length: {maximum: 10}
end
