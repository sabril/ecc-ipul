require File.join(File.dirname(__FILE__), "../lib/diffie_hellman")

curve = Ecc::Curve.new 324, 1287, 3851
point = Ecc::Point.new 920, 303

server = Ecc::DiffieHellman.new curve, point, 1194
client   = Ecc::DiffieHellman.new curve, point, 1759

server_pub = server.computePublicKey()
puts "Server Public Key: #{server_pub}"
client_pub   = client.computePublicKey()
puts "CLient Public Key: #{client_pub}"

# client compute shared secret using client public key
res1 = server.computeSharedSecret client_pub

# server compute shared secret using client public key
res2 = client.computeSharedSecret server_pub

# should be the same
puts res1
puts res2

