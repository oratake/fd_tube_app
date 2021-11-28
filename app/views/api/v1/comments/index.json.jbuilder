json.set! :comments do
  json.array! @comments do |comment|
    json.extract! comment, :id, :context, :user_id, :video_id, :created_at, :updated_at
    json.first_name comment.user.first_name
    json.last_name comment.user.last_name
  end
end
