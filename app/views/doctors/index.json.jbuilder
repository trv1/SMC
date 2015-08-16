json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :last_name, :first_name, :second_name, :polyclinic_id
  json.url doctor_url(doctor, format: :json)
end
