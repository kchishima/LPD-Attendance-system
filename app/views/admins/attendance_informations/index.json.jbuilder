json.array!(@ais) do |ai|
  json.title ai.status_i18n
  json.url admins_attendance_information_path(ai.id)
  json.start ai.time_in

  unless ai.time_out.nil?
    json.end ai.time_out
  else
    json.end nil
  end

end