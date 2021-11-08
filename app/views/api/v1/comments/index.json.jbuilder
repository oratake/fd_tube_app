json.set! :comments do
  json.array! @comments do |comment|
    json.extract! comment, :id, :context, :user_id, :video_id, :created_at, :updated_at
  end
end
