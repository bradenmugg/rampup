def encrypt (string_in)
  string_in
  encrypted = (0...string_in.length).map { ('a'..'z').to_a[rand(26)] }.join
  hash_cypher = { "#{encrypted}" => "#{string_in}" } 
  return hash_cypher
end

def decrypt (cypher_in, hash_cypher)
  return hash_cypher["#{cypher_in}"]
end

puts "Please enter your string"
string_in = gets.chomp
hash_cypher = encrypt(string_in)
puts "#{hash_cypher.key(string_in)}"
puts "What is your cypher?"
code_in = gets.chomp
puts "#{hash_cypher[code_in]}"

