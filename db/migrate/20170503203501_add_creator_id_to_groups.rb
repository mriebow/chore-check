class AddCreatorIdToGroups < ActiveRecord::Migration[5.0]
  def change
    change_table :groups do |t|
      t.belongs_to :creator, null: false
    end
  end
end
