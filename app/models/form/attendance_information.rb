class Form::AttendanceInformation < AttendanceInformation
  REGISTRABLE_ATTRIBUTES = %i(
  temp_time_in(1i) temp_time_in(2i) temp_time_in(3i) temp_time_in(4i) temp_time_in(5i)
  temp_time_out(1i) temp_time_out(2i) temp_time_out(3i) temp_time_out(4i) temp_time_out(5i)
  )
end