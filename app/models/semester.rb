class Semester < ActiveRecord::Base
  validates :semester_name, presence: true,length: {maximum: 20}
  validates :semester_type, inclusion: {in: %w(Mandatory Optional),
      message: "%{value} is not a valid semester type. Must be 'Mandatory' or 'Optional'."}
end
