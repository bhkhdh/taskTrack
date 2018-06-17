class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title, limit: 80
      t.string :description
      t.integer :reward
      t.string :status, default: 'Open'
      t.integer :parent_id
      t.integer :user_id, default: nil
      t.boolean :assigned, default: false
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
