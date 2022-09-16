class CreateAttendanceHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :attendance_histories do |t|
      t.references :member, null: false, foreign_key: true
      t.date :date
      t.time :attend_time
      t.time :leave_time
      t.boolean :is_attendance

      t.timestamps
    end
  end
end
