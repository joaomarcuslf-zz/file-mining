require_relative 'resources/mining.rb'

the_miner = Miner.new

file = File.open('files/files_name.txt', 'r')

file.each do |path|
  the_miner.mining_f("files/#{path}")
end

puts "-=Files opened and mined=-"

while true
  puts "------------------------------------------"
  puts "Say what you want:"
  puts "0 - Quit"
  puts "1 - Find"
  puts "2 - Show"
  print ">>> "

  choice = gets.to_i

  case choice
  when 0
    break
  when 1
    print "  Say the word you want: "
    aval = the_miner.find(gets.chomp)
    puts aval if aval != nil
    puts "Not found" if aval == nil
  when 2
    the_miner.show
  else
    puts "Not a valid choice"
  end
end
