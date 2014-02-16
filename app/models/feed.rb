class Feed < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :feed_items
	attr_accessible :title, :description, :link, :published_at, :image, :category, :last_build_date


	class << self
		def latest
			order(updated_at: :desc).limit(5)
		end
		def search(q)
			where("title like ? or description like ?",q, q)
		end
	end

	def get_two_feed_items
		FeedItem.get_two(self.id)
	end

	def process_url(url)
		feed = Feedzirra::Feed.fetch_and_parse(url,:on_success => lambda {|url, feed| puts feed.title },:on_failure => lambda {|curl, error| puts error})
	end
end
