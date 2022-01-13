class CreateAttendanceInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :attendance_informations do |t|
    t.references :member, foreign_key: true
    t.datetime :time_in
    t.datetime :time_out
    t.timestamps
    end
  end
end
