class CreateTwitterData < ActiveRecord::Migration
  def change
    create_table :twitter_data do |t|
      t.integer :company_id
      t.date :data_date
      t.integer :favorites
      t.integer :retweets
      t.integer :followers
      t.float :polarity

      t.timestamps
    end
  end
end
