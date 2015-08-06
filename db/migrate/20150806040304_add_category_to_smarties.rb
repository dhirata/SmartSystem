class AddCategoryToSmarties < ActiveRecord::Migration
  def change
  	add_column :smarties, :category, :string
  end
end
