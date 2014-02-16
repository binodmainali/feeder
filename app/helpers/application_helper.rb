module ApplicationHelper
	def get_recent_feeds_for_user
		current_feeds = []

		current_user.feeds.each do |feed|
			current_feeds << [feed,feed.get_two_feed_items]
		end
		current_feeds
	end
end
