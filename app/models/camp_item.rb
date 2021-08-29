class CampItem < ApplicationRecord
  belongs_to :relief_camp
  belongs_to :item
end
