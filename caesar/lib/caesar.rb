def cipher(string, int)
    ascii_string = string.bytes
    int = int.to_i
    i = 0
    cipher_array = []
    while i < string.length
        ascii_string[i] += int
        if ascii_string[i] == 32 + int
            ascii_string[i] -= int
        elsif ascii_string[i] > 90 && ascii_string[i] < 91 + int
            ascii_string[i] -= 26
        elsif ascii_string[i] > 122
            ascii_string[i] -= 26
        end
        cipher_array[i] = ascii_string[i].chr
        i += 1
    end
    cipher_string = cipher_array.join("")
    puts "Your encrypted message is: " + cipher_string
end

def decipher(string, int)
    ascii_string = string.bytes
    int = int.to_i
    i = 0
    decipher_array = []
    while i < string.length
        ascii_string[i] -= int
        if ascii_string[i] == 32 - int
            ascii_string[i] += int
        elsif ascii_string[i] < 97 && ascii_string[i] > 96 - int
            ascii_string[i] += 26
        elsif ascii_string[i] < 65
            ascii_string[i] += 26
        end
        decipher_array[i] = ascii_string[i].chr
        i += 1
    end
    decipher_string = decipher_array.join("")
    puts decipher_string
end

puts "Do you want to encrypt or decipher a message?"
response = gets.chomp
if response.downcase == "encrypt"
    puts "Okay, give me the message you'd like to encrypt"
    secret_message = gets.chomp
    puts "Now give me any number between 1 and 31"
    number = gets.chomp
    while number.to_i < 1 || number.to_i > 31
        puts "How about you try that again, funny guy?"
        number = gets.chomp
    end
    cipher(secret_message, number)
elsif response.downcase == "decipher"
    puts "Okay, what message would you like to decipher?"
    secret_message = gets.chomp
    puts "Do you know the number this is encrypted with? If not, just put any number between 1 and 31 and see if you get lucky."
    number = gets.chomp
    while number.to_i < 1 || number.to_i > 31
        puts "No, between 1 and 31"
        number = gets.chomp
    end
    decipher(secret_message, number)
else
    puts "Try typing one of the two options I gave you. But first, go to time out."
end



