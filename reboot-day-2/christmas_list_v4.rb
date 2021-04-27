puts "Welcome to your chrismtas list 🎄"
require 'nokogiri'
require 'open-uri'

christmas_list = {
  'Perfume' => false,
  'Book' => false,
  'Surfboard' => false
}

user_input = nil

def display_list(my_hash)
  array_of_keys = my_hash.keys

  array_of_keys.each_with_index do |key_item, index|
    value_item = my_hash[key_item]
    value = (value_item ? "[X]" : "[]")
    puts "#{index + 1}. #{value} #{key_item} "
  end
end

until user_input == 'quit'

  puts 'Which action [list|add|delete|mark|idea| quit]?'
  user_input = gets.chomp.downcase
  case user_input
  when 'list'
    display_list(christmas_list)
  when 'add'
    puts 'What item do you want to add to your list'
    new_item = gets.chomp
    christmas_list[new_item] = false
    display_list(christmas_list)
  when 'delete'
    display_list(christmas_list)
    puts 'Which item *NUMBER* do you want to remove from your list?'
    item_index = gets.chomp.to_i - 1
    puts "item_index : #{item_index}"
    array_of_keys = christmas_list.keys
    key_to_delete = array_of_keys[item_index]
    christmas_list.delete(key_to_delete)
  when 'mark'
    display_list(christmas_list)

    puts "which item to do you want to mark ? Choose a number"
    user_mark_index = gets.chomp.to_i - 1

    array_of_keys = christmas_list.keys

    key_to_mark = array_of_keys[user_mark_index]

    christmas_list[key_to_mark] = !christmas_list[key_to_mark]

    display_list(christmas_list)
  when 'idea'
    puts "what article do you want to get inspiration from?"
    article = gets.chomp

    html_content = URI.open("https://www.etsy.com/search?q=#{article}").read

    doc_nokogiri = Nokogiri::HTML(html_content)

    array_of_nokogiri = doc_nokogiri.search('.v2-listing-card .v2-listing-card__info .text-body')


    final_etsy_array = []
    array_of_nokogiri.each do |element|
      final_etsy_array << element.text.strip
    end

    final_etsy_array.each_with_index do |element, index|
      puts "#{index + 1} - #{element}"
    end

    puts "which item do you want import inside of your christmas list?"
    user_choice_index = gets.chomp.to_i - 1

    key_to_add = final_etsy_array[user_choice_index]
    christmas_list[key_to_add] = false
    display_list(christmas_list)
  else
    puts "#{user_input} is not allowed. Try again" unless user_input == 'quit'
  end
end

puts 'Thanks for using our amazing app! 🦌'
