class AddTempTimeToAttendanceInformations < ActiveRecord::Migration[5.2]
  def change
    add_column :attendance_informations, :temp_time_in, :datetime

    add_column :attendance_informations, :temp_time_out, :datetime

  end
end
