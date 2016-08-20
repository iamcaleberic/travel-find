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
            subject.name = "London"
            expect(subject.name).to eq("London")
        end


        it "allows reading and writing for country" do
            subject.country = "England"
            expect(subject.country).to eq("England")
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
            let(:new_option){Destination.new()}
            it "allows setting the :name" do
                subject.name = "Dubai"
                expect(subject.name).to eq("Dubai")
                
            end

            it "allows setting the :country" do
                subject.country = "UAE"
                expect(subject.country).to eq("UAE")
            end

            it "allows setting he price" do 
                subject.price = 500
                expect(subject.price).to eq(500)
            end
        
        end 
    
    end
end