class Feed < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :feed_items
	attr_accessible :title, :description, :link, :published_at, :image, :category, :last_build_date


	class << self
		def latest
			order(updated_at: :desc).limit(5)
		end
		def search(q)
			where("title like ? or description like ? or category like ? or id in (?)",q, q, q,FeedItem.search(q).map(&:feed_id).uniq)
		end
	end

	def get_two_feed_items
		FeedItem.get_two(self.id)
	end

	def process_url(url)
		feed = Feedzirra::Feed.fetch_and_parse(url,:on_success => lambda {|url, feed| puts feed.title },:on_failure => lambda {|curl, error| puts error})
	end

	def self.process_background
		all.each do |feed|
			rss = Feedzirra::Feed.fetch_and_parse(feed.link)
			FeedItem.process_and_save_feed(rss.entries,feed.id)
		end
		
	end
end
