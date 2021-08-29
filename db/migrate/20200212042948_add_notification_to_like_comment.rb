class AddNotificationToLikeComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :like_comments, :notification, index: true
  end
end
