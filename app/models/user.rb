class User < ActiveRecord::Base
  # Include default user modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :registers
  has_many :semesters, through: :registers
  has_many :courses, through: :registers
end
