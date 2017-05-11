class AddUserIdAndGroupIdToChore < ActiveRecord::Migration[5.0]
  def change
    add_column :chores, :user_id, :integer
    add_column :chores, :group_id, :integer
  end
end
