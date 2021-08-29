class CenterRequest < ApplicationRecord
  belongs_to :item
  belongs_to :collection_center


  before_create do
    self.status = 'open'
  end
end
