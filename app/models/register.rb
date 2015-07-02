class Register < ActiveRecord::Base
  validates :cgpa,allow_blank: true, :numericality => { :greater_than_or_equal_to => 0.00, :less_than_or_equal_to => 4.00 }, on: [:create, :update]
  validate :course_unique_for_each_user, on: :create
  belongs_to :course
  belongs_to :semester
  belongs_to :user

  private
  #Validating so that use can not register the same course twice.
  def course_unique_for_each_user
    number = Register.where('course_id = ? and user_id = ?', course_id, user_id).length
    if(number=1)
      errors.add(:course_id, "is already registered.")
    end
  end

end

