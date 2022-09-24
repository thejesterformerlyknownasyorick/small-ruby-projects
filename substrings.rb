dictionary_array = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
    word_array = string.split(" ")
    i = 0
    while i < word_array.length
        word_array[i] = dictionary.select { |word| word == word_array[i].downcase }
        i += 1
    end
    word_array = word_array.flatten
    word_count_hash = word_array.reduce(Hash.new(0)) do |word, count|
        word[count] += 1
        word
    end
    word_count_hash
end

p substrings("below them Below Go GO gO going go down how howdy Horn", dictionary_array)