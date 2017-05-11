class CreateDuties < ActiveRecord::Migration[5.0]
  def change
    create_table :duties do |t|
      t.belongs_to :chore
      t.belongs_to :group
    end
  end
end
