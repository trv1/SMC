json.array!(@users) do |user|
  json.extract! user, :id, :last_name, :first_name, :second_name, :birthday, :sex, :passport, :policy, :login, :password
  json.url user_url(user, format: :json)
end
