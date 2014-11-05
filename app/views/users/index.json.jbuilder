json.array!(@users) do |user|
  json.extract! user, :id, :Email, :Name, :Gender
  json.url user_url(user, format: :json)
end
