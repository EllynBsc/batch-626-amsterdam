require 'nokogiri'

# WORKING WITH A LOCAL FILE
# filepath = "results.html"
# # puts filepath

# # 1. We get the HTML page content
# html_content = File.open(filepath)
# # puts html_content

# # 2. We build a Nokogiri document from this file
# doc_nokogiri = Nokogiri::HTML(html_content)
# # puts doc
# # puts doc.class

# # 3. We search for the correct elements containing the items' title in our HTML doc
# # class: .class_name
# # id: #id_name
# # tag: name_of_tag
# array_of_nokogiri = doc_nokogiri.search('.v2-listing-card .v2-listing-card__info .text-body')


# final_etsy_array = []
# array_of_nokogiri.each do |element|
#   final_etsy_array << element.text.strip
# end

# final_etsy_array.each_with_index do |element, index|
#   puts "#{index + 1} - #{element}"
# end


# WORKING WITH A URL
require 'open-uri'


puts "what article do you want to get inspiration from?"
article = gets.chomp
# 1. We get the HTML page content
html_content = URI.open("https://www.etsy.com/search?q=#{article}").read
# puts html_content

# 2. We build a Nokogiri document from this file
doc_nokogiri = Nokogiri::HTML(html_content)
# puts doc
# puts doc.class

# 3. We search for the correct elements containing the items' title in our HTML doc
# class: .class_name
# id: #id_name
# tag: name_of_tag
array_of_nokogiri = doc_nokogiri.search('.v2-listing-card .v2-listing-card__info .text-body')


final_etsy_array = []
array_of_nokogiri.each do |element|
  final_etsy_array << element.text.strip
end

final_etsy_array.each_with_index do |element, index|
  puts "#{index + 1} - #{element}"
end
