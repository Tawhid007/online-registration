class AddUserToRegisters < ActiveRecord::Migration
  def change
    add_reference :registers, :user, index: true, foreign_key: true
  end
end
