# Write a method that returns the acronym of a sentence.

# I AM A CAT => IAAC
# SAVE OUR SOULS => SOS

def acronym(sentence)
  # break sentence down into words
  # SAME THING: sentence.split
  words = sentence.split(" ")
  # create letters array
  letters = []
  # iterate over the letters
  words.each do |word|
    # we can take the first letter of each word
    letters << word[0]
  end
  # join them all
  letters.join.upcase
  # make sure they're capitalized
end

def acronym_advanced(sentence)
  sentence.split.map { |word| word[0] }.join.upcase
end

puts "The acronym of I AM A CAT is"
p acronym("I AM A CAT")

puts "The acronym of SAVE OUR SOULS is "
p acronym("SAVE OUR SOULS")

puts "The acronym of FLYING OBJECT REACHING EARTH is"
p acronym("FLYING OBJECT REACHING EARTH")

puts "The acronym of Oh My God is"
p acronym_advanced("Oh My God")

puts "The acronym of What the Farm is "
p acronym_advanced("What the Farm")

puts "The acronym of Laughing My Arms Out is"
p acronym_advanced("laughing my arms out")


