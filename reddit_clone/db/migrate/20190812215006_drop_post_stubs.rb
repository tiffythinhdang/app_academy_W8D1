class DropPostStubs < ActiveRecord::Migration[5.2]
  def change
    drop_table :post_stubs
  end
end
