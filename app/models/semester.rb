class Semester < ActiveRecord::Base
  validates :semester_name, presence: true,length: {maximum: 15}
  validates :semester_type, inclusion: {in: %w(Mendatory Optional),
      message: "%{value} is not a valid semester type. Must be 'Mendatory' or 'Optional'."}
end
