#this will update the feeds
loop do
  Feed.process_background
  puts "updated"
  sleep(60)
end
