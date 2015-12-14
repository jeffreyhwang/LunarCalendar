class AddListIdColumnToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :list_id, :integer
  end
end
