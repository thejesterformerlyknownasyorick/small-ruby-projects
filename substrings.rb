dictionary_array = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
    p dictionary.select { |word| word == string.downcase }
end

substrings("below", dictionary_array)
p dictionary_array