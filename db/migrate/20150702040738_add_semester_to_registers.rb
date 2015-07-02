class AddSemesterToRegisters < ActiveRecord::Migration
  def change
    add_reference :registers, :semester, index: true, foreign_key: true
  end
end
