class DeleteForeignKeyColumnsFromTables < ActiveRecord::Migration[5.2]
  def up
    remove_column :posts, :sub_id
  end

  def down
    add_column :posts, :sub_id, :integer
  end
end
