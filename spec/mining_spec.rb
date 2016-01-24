require 'rspec'
require_relative '../resources/mining'

describe Miner do
  context 'Receiving one phrase per time to mine' do

    before {
      @mine_tester = Miner.new
    }

    describe '#mining' do

      context 'when it\'s a normal phrase' do
        subject do
          "The Ruby language is a language totally object oriented"
        end

        it 'should cut the string and present words quantity' do
          expect(@mine_tester.mining(subject)).to eq "8 words"
        end
      end

      context 'when it\'s a messy phrase' do
        subject do
          "É é, é- e e e p"
        end

        it 'should take out the symbols and present the new words quantity' do
          expect(@mine_tester.mining(subject)).to eq "12 words"
        end
      end


      context 'when it\' a empty phrase' do
        subject do
          ''
        end

        it 'should return nil' do
          expect(@mine_tester.mining(subject)).to be_nil
        end
      end
    end
  end

  context 'Opening a entire file and search for a word' do
    before {
      @mine_tester = Miner.new
      @mine_tester.mining_f('files/hello_world.txt')
    }

    describe '#find' do
      context 'searching for an existing word' do
        subject do
          "hello"
        end

        it 'should present the quatities of times it\' repeated' do
          expect(@mine_tester.find(subject)).to eq "2 times"
        end
      end

      context 'searching for an non-existing word' do
        subject do
          "foobar"
        end

        it 'should present nil' do
          expect(@mine_tester.find(subject)).to be_nil
        end
      end
    end
  end
end
