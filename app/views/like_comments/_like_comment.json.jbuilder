json.extract! like_comment, :id, :like, :comment, :parent_id, :parent_type, :created_at, :updated_at
json.url like_comment_url(like_comment, format: :json)
