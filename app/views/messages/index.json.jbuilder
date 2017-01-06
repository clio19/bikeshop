json.array!(@messages) do |message|
  json.extract! message, :id, :title, :body, :status
  json.url message_url(message, format: :json)
end
