class AddCourseToRegisters < ActiveRecord::Migration
  def change
    add_reference :registers, :course, index: true, foreign_key: true
  end
end
