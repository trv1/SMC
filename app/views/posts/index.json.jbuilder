json.array!(@posts) do |post|
  json.extract! post, :id, :name, :polyclinic_id
  json.url post_url(post, format: :json)
end
