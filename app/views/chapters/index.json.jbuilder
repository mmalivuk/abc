json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :user_id, :api_key
  json.url chapter_url(chapter, format: :json)
end
