class AddCgpaToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :cgpa, :decimal, precision: 4, scale: 2
  end
end
