class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.boolean :is_attendance
      t.text :contact
      t.string :attendance_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :members, :attendance_code, unique: true
  end
end
