class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :email
      t.string :facebook_id
      t.string :zip_code, null: false
      t.string :address, null: false
      t.string :tel, null: false
      t.integer  :sex, null: false
      t.datetime  :birth_day, null: false
      t.integer  :status, null: false
      t.text  :memo
      t.timestamps null: false
      t.string :password_digest, null: false
    end
  end
end
