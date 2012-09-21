class AddUserToWaittimes < ActiveRecord::Migration
  def change
    add_column :waittimes, :user_id, :integer
  end
end
