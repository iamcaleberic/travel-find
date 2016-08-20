require 'destination' 

describe Destination do
    let(:test_file){
        'spec/fixtures/destinations_test.txt'
    }
    let(:hong_kong){
        Destination.new(:name => "Hong Kong" , :country => "China" , :price => '1000')
    }
    describe 'attributes' do
        it "allows reading and writing for :name" 


        it "allows reading and writing for country"
    end

    describe '#initialize ' do 
        context 'with no options' 
        end

        context "with custom options" do
        end 
    
    end
end