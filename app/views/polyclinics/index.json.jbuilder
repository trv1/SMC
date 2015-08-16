json.array!(@polyclinics) do |polyclinic|
  json.extract! polyclinic, :id, :name, :phone, :address, :district, :locality
  json.url polyclinic_url(polyclinic, format: :json)
end
