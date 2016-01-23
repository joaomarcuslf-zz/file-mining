# encoding: UTF-8

class Miner
  @@counter = Hash.new
  def mining(phrase)
    sinais = [',', "\'", "\"", '.', ';', '-',
              "\\", "_", "+", "#", "@", "(",
              ")", "]", "["]

    return nil if phrase == ''

    for sig in sinais do
      phrase.gsub!(sig, ' ')
    end
    arr = phrase.downcase.split(" ")

    arr.each do |elm|
      @@counter[elm] ||= 0
      @@counter[elm] += 1
    end
    "#{@@counter.size} palavras"
  end

  def show
    @@counter.each do |key, value|
      puts "#{key} - #{value}"
    end
  end
end
