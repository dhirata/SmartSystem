class AddTimeStampToSmarties < ActiveRecord::Migration
  def change
    add_column :smarties, :timestamp, :datetime
  end
end
