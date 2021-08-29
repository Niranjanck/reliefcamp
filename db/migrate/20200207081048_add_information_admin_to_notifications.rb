class AddInformationAdminToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :information_admin, index: true
  end
end
