json.array!(@requests) do |request|
  json.extract! request, :id, :number, :polyclinic_id, :post_id, :doctor_id, :user_id
  json.url request_url(request, format: :json)
end
