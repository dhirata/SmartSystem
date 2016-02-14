class CreateSmarties < ActiveRecord::Migration
  def change
    create_table :smarties do |t|
      t.integer :customer_id
      t.text :description
      t.string :analysis
      t.integer :company_id
      t.datetime :timestamp
      t.string :category

      t.timestamps
    end
  end
end
