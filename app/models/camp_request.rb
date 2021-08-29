class CampRequest < ApplicationRecord
  belongs_to :relief_camp
  belongs_to :item
  belongs_to :collection_center, optional: true

  before_create do
    self.status = 'open'
  end
end
