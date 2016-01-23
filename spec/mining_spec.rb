require 'rspec'
require_relative '../resources/mining'

describe Miner do
  context 'Recebendo apenas uma frase por vez para mineração' do

    before {
      @mine_tester = Miner.new
    }

    describe '#mining' do

      context 'quando com a frase é uma frase normal' do
        subject do
          "A linguagem Ruby é uma linguagem totalmente orientada a objeto"
        end

        it 'deve cortar a string em pedaços e devolver a quantidade de palavras' do
          expect(@mine_tester.mining(subject)).to eq "8 palavras"
        end
      end

      context 'quando a frase é uma mistura' do
        subject do
          "É é, é- e e e p"
        end

        it 'deve tirar os simbolos desnecessários e devolver a quantidade de palavras' do
          expect(@mine_tester.mining(subject)).to eq "11 palavras"
        end
      end


      context 'quando a frase é uma frase vazia' do
        subject do
          ''
        end

        it 'deve devolver nil' do
          expect(@mine_tester.mining(subject)).to be_nil
        end
      end
    end
  end
end
