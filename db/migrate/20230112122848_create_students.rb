class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :course
      t.date :DOB

      t.timestamps
    end
  end
end
