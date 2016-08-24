class CreateTwitterSearchApis < ActiveRecord::Migration[5.0]
  def change
    create_table :twitter_search_apis do |t|

      t.timestamps
    end
  end
end
