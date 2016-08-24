class CreateTwitterSearchScrapes < ActiveRecord::Migration[5.0]
  def change
    create_table :twitter_search_scrapes do |t|

      t.timestamps
    end
  end
end
