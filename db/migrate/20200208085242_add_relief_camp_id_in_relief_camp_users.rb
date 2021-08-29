class AddReliefCampIdInReliefCampUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :reliefcamp_users, :relief_camp, index: true
  end
end
