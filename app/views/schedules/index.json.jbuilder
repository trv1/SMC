json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :polyclinic_id, :post_id, :doctor_id, :weekday, :time_begin, :time_end
  json.url schedule_url(schedule, format: :json)
end
