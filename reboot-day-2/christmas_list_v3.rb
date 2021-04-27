puts "Welcome to your chrismtas list 🎄"

# STEP 3 : We change the modelisation of our shopping list to a hash object.
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
    # if value_item
    #   puts "#{index + 1}. [X] #{key_item} "
    # else
    #   puts "#{index + 1}. [] #{key_item} "
    # end
    value = (value_item ? "[X]" : "[]") #condition ? when_true : when_false
    puts "#{index + 1}. #{value} #{key_item} "
  end
end

until user_input == 'quit'

  puts 'Which action [list|add|delete|mark|quit]?'
  user_input = gets.chomp.downcase
  case user_input
  when 'list'
    display_list(christmas_list)
  when 'add'
    puts 'What item do you want to add to your list'
    # name_of_your_hash[new_key] = new_value
    new_item = gets.chomp
    christmas_list[new_item] = false
    display_list(christmas_list)
  when 'delete'
    display_list(christmas_list)
    puts 'Which item *NUMBER* do you want to remove from your list?'
    item_index = gets.chomp.to_i - 1  #=> 0
    puts "item_index : #{item_index}"
    #1. Use this index to retrieve the key from the christmast_list hash
        # 1.1 convert my hash into an array
    array_of_keys = christmas_list.keys #=> ['perfurm', 'book', 'surfboard']
    puts "array_of_keys: #{array_of_keys}"
        # 1.2 use my index to access my key element
    key_to_delete = array_of_keys[item_index]  #=> arrays_of_keys[0]
    puts "key_to_delete: #{key_to_delete}"
    #2. Use the key to delete key value pair.
    christmas_list.delete(key_to_delete)
  when 'mark'
    display_list(christmas_list)

    puts "which item to do you want to mark ? Choose a number"
    user_mark_index = gets.chomp.to_i - 1
    puts "useindexr_mark_ #{user_mark_index}"


    array_of_keys = christmas_list.keys
    puts "array of keys: #{array_of_keys}"

    key_to_mark = array_of_keys[user_mark_index]
    puts "key to mark: #{key_to_mark}"

    puts "changing the value to true in the hash christmas_list ...."
    # christmas_list[key_to_mark] = true  #false to true

    christmas_list[key_to_mark] = !christmas_list[key_to_mark]

    display_list(christmas_list)
  when 'idea'
    #
  else
    puts "#{user_input} is not allowed. Try again" unless user_input == 'quit'
  end
end

puts 'Thanks for using our amazing app! 🦌'
