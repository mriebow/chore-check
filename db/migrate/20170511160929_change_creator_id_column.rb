class ChangeCreatorIdColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :groups, :creator_id, :integer
  end
end
