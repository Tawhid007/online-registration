class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :semester_name
      t.string :semester_type

      t.timestamps null: false
    end
  end
end
