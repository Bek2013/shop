class AddCategoriesIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :category_id, :integer, default: 1
  end
end
