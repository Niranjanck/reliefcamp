class ReliefCamp < ApplicationRecord

  has_many :camp_items
  has_many :relief_camp_admins
  has_many :reliefcamp_users
  has_many :camp_requests
end
