class FeedItem < ActiveRecord::Base

	attr_accessible :name, :summary, :url, :published_at, :guid, :feed_id
	belongs_to :feeds

	class << self
		def latest
			order(updated_at: :desc).limit(10)
		end

		def get_two(feed_id)
			order(updated_at: :desc).limit(2).where(feed_id: feed_id)
		end

		def search(q)
			where("name like ? or summary like ? or url like ?",q, q, q)
		end
	end

	def self.process_and_save_feed(entries,feed_id)
    	entries.each do |entry|
	        FeedItem.where(
	          :name         => entry.title,
	          :summary      => entry.summary,
	          :url          => entry.url,
	          :published_at => entry.published,
	          :guid         => entry.id,
	          :feed_id 		=> feed_id
	        ).first_or_create
  		end
    end    
end
