class LikeComment < ApplicationRecord
  belongs_to :parent, polymorphic: true
  belongs_to :user , optional: true
  belongs_to :notification

  scope :likes, ->{ where(like: true)}
  scope :dislikes, ->{ where(like: false)}
end
