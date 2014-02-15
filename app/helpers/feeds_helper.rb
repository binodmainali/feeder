module FeedsHelper
	def update_feed_object feed , processed_feed
		feed.title = processed_feed.title if processed_feed.respond_to?(:title)
		feed.last_build_date = processed_feed.last_build_date if processed_feed.respond_to?(:last_build_date)
		feed.image = processed_feed.image if processed_feed.respond_to?(:image)
		feed.category = processed_feed.category if processed_feed.respond_to?(:category)
		feed.description = processed_feed.description if processed_feed.respond_to?(:description)
		feed.published_at = processed_feed.published_at if processed_feed.respond_to?(:published_at)
		feed
	end
end
