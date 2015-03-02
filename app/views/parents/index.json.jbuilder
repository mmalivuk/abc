json.array!(@parents) do |parent|
  json.extract! parent, :id, :user_id, :api_key
  json.url parent_url(parent, format: :json)
end
