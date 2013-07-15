#!/usr/bin/env ruby
#
# Our Cron Script to loop through all Filters and run an import for them.
# To use it add `cd /path/to/rails/app && rails runner ./cron.rb` to your crontab.

START_TIME = Time.now

begin
  Filter.all.each do |filter|
    puts "Running import for #{filter.name}..."
    filter.import_analytics
  end
rescue
  puts "An error occurred, did you call the script from within the Rails environment?"
end

puts "Completed in #{(Time.now - START_TIME) * 100} seconds."
