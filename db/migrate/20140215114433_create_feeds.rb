class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.text :description
      t.string :image
      t.datetime :last_build_date
      t.datetime :published_at
      t.string :link
      t.string :category

      t.timestamps
    end
  end
end
