loop do
  Feed.process_background
  puts "updated"
  sleep(60)
end
