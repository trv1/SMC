json.array!(@routines) do |routine|
  json.extract! routine, :id, :polyclinic_id, :post_id, :schedule_id, :timing
  json.url routine_url(routine, format: :json)
end
