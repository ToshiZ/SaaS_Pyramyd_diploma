json.array!(@users) do |user|
  json.extract! user, :email, :last_sign_in_ip
  json.url user_url(user, format: :json)
end
