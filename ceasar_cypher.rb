def ceasar(string_in)
  ascii_array = []
  string_in.each_byte { |c| ascii_array.push(c) }
  ascii_array.map! { |c| (c += 5) }
  ascii_array.map! do |c|
    if (c > 90 && c < 97) || c > 122
      c -= 26
    else
      c = c
    end
  end
  ascii_array.map! { |c| c.chr }
  string_out = ascii_array.join
  return (string_out)
end

def decrypt_ceasar (string_in)
  ascii_array = []
  string_in.each_byte { |c| ascii_array.push(c) }
  ascii_array.map! { |c| (c -= 5) }
  ascii_array.map! do |c|
    if (c < 65 && c != 32)  || (c > 90 && c < 97)
      c +=26
    else
      c = c
    end
  end
  ascii_array.map! { |c| c.chr }
  string_out = ascii_array.join
  return string_out
end

cyphered_string = ceasar("This is a string")
puts(cyphered_string)
decrypted_string = decrypt_ceasar(cyphered_string)
puts (decrypted_string)