json.array!(@work_scheduleds) do |work_scheduled|
  json.url edit_chart_path(work_scheduled.id)
  json.start work_scheduled.time_in

  unless work_scheduled.time_out.nil?
    json.end work_scheduled.time_out
  else
    json.end nil
  end
end