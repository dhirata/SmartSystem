class CreateSmarties < ActiveRecord::Migration
  def change
    create_table :smarties do |t|
      t.integer :customer_id
      t.text :description
      t.string :analysis
      t.integer :company_id

      t.timestamps
    end
  end
end
