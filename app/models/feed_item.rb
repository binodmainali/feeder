class FeedItem < ActiveRecord::Base

	attr_accessible :name, :summary, :url, :published_at, :guid, :feed_id
	belongs_to :feeds

	class << self
		def latest
			order(updated_at: :asc).limit(10)
		end
	end

	def self.process_and_save_feed(entries,feed_id)
    	entries.each do |entry|
      	unless exists? :guid => entry.id
	        create!(
	          :name         => entry.title,
	          :summary      => entry.summary,
	          :url          => entry.url,
	          :published_at => entry.published,
	          :guid         => entry.id,
	          :feed_id 		=> feed_id
	        )
    	  end
  		end
    end    
end
