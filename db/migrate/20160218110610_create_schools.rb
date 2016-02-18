class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :zip_code, null: false
      t.string :address, null: false
      t.string :tel, null: false
      t.string :URL, null: false
      t.text  :memo
      t.timestamps null: false
    end
  end
end
