class CreatePostStubs < ActiveRecord::Migration[5.2]
  def change
    create_table :post_stubs do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false
      t.index :post_id
      t.index :sub_id
      t.timestamps
    end
  end
end
