class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: { unique: true }
      t.float :price, null: false
      t.string :description, null: false
      t.timestamps
    end
    add_column :products, :admin_user_id, :integer
    add_index :products, :admin_user_id
  end
end
