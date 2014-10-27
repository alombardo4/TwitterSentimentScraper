require 'json'
require 'csv'
require_relative "ProcessedFB"

file = File.open('facebook.json', 'r')

facebook_hash = JSON.parse(file.read)["data"]

facebook_hash.each do |fb|
	puts fb['id']

end


pfbs = Array.new
facebook_hash.each do |fb|
  pfb = ProcessedFB.new
  pfb.text = fb['message'].to_s
  pfb.created_at = fb['created_time'].to_s
  pfb.picture = fb['picture'].to_s
  pfb.link = fb['link'].to_s
  pfb.postid = fb['id'].to_s
  pfb.uri = fb['actions'][0]['link'].to_s
  pfbs << pfb
end

CSV.open('processedFB.csv', 'w') do |csv|
  csv << pfbs[0].csv_header
  pfbs.each do |pfb|
    csv << pfb.csv_line
  end
end