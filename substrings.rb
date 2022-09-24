dictionary_array = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
    word_array = string.split(" ")
    i = 0
    while i < word_array.length
        p dictionary.select { |word| word == word_array[i].downcase }
        i += 1
    end
end

substrings("below them Below Go GO gO going go down how howdy Horn", dictionary_array)