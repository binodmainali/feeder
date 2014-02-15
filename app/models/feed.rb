class Feed < ActiveRecord::Base
	has_and_belongs_to_many :users, join_table: "users_feeds"
	has_many :feed_items
	attr_accessible :title, :description
end
