class CollectionCenter < ApplicationRecord
  has_many :collection_center_admins
  has_many :center_items
  has_many :center_requests
end
