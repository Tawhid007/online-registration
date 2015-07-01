class Semester < ActiveRecord::Base
  has_many :registrations
  has_many :courses, through: :registrations
  has_many :users, through: :registrations
  validates :semester_name, presence: true,length: {maximum: 20}
  validates :semester_type, inclusion: {in: %w(Mandatory Optional),
      message: "%{value} is not a valid semester type. Must be 'Mandatory' or 'Optional'."}

end
