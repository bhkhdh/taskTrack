class CreateParents < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.string :full_name, limit: 80
      t.integer :balance, default: 0

      t.timestamps
    end
  end
end
