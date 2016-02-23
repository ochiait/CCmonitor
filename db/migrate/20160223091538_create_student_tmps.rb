class CreateStudentTmps < ActiveRecord::Migration
  def change
    create_table :student_tmps do |t|
      t.string :email, null: false
      t.string :facebook_id
      t.integer :lifetime, null: false
      t.string :key, null: false
      t.timestamps null: false
    end
  end
end
