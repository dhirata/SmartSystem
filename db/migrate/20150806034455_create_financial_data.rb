class CreateFinancialData < ActiveRecord::Migration
  def change
    create_table :financial_data do |t|
      t.float :stock_price
      t.date :data_date
      t.integer :company_id

      t.timestamps
    end
  end
end
