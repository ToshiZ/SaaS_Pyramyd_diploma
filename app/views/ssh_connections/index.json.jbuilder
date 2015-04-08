json.array!(@ssh_connections) do |ssh_connection|
  json.extract! ssh_connection, :id, :name, :ip, :login
  json.url ssh_connection_url(ssh_connection, format: :json)
end
