class AddAssignmentColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :chores, :assignment, :string
  end
end
