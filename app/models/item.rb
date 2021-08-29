class Item < ApplicationRecord
  has_many :camp_items
  has_many :center_items
end
