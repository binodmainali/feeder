module ApplicationHelper
	def get_recent_feeds_for_user
		current_feeds = []

		current_user.feeds.order(updated_at: :desc).each_with_index do |feed,index|
			current_feeds << [feed,feed.get_two_feed_items]
			break if index == 4
		end
		current_feeds
	end
end
