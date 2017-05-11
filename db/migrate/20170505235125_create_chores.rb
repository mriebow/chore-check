class CreateChores < ActiveRecord::Migration[5.0]
  def change
    create_table :chores do |t|
      t.string :task, null: false
      t.string :deadline, null: false
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
