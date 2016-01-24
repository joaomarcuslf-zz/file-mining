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
end
