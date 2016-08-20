require 'destination' 

describe Destination do
    let(:test_file){
        'spec/fixtures/destinations_test.txt'
    }
    let(:hong_kong){
        Destination.new(:name => "Hong Kong" , :country => "China" , :price => '1000')
    }
    describe 'attributes' do
        it "allows reading and writing for :name" do
            expect(hong_kong.name).to eq("Hong Kong")
        end


        it "allows reading and writing for country" do
            expect(hong_kong.country).to eq("China")
        end
    end

    describe '#initialize ' do 
        
        context 'with no options' do
            let(:no_options ){Destination.new}

            it "sets a default of "" for :name " do
                expect(no_options.name).to eq("")
            end

            it "sets a default of "" for :country" do
                expect(no_options.country).to eq("")
            end

            it " sets a default  of "" for :price" do
                expect(no_options.price).to eq("")
            end
        end

        context "with custom options" do
        
        end 
    
    end
end