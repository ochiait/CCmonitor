class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.string :email
      t.string :facebook_id
      t.string :zip_code, null: false
      t.string :address, null: false
      t.string :tel, null: false
      t.integer  :sex, null: false
      t.datetime  :birth_day
      t.text  :memo
      t.timestamps null: false
    end
  end
end
