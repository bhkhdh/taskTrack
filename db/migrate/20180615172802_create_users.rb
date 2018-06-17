class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :full_name, limit: 80
      t.integer :balance, default: 0
      t.integer :parent_id, null: false

      t.timestamps
    end
  end
end
