# encoding: UTF-8

describe "NumberHelper " do

    include NumberHelper
    describe '#number_to_currency' do
        context "using default values "do 
            it "correctly formats an integer" do
                expect(number_to_currency(2)).to eq(' £ 2.00')
            end
                

            it "correctly formats a float" do
                expect(number_to_currency(1.200)).to eq(' £ 1.20')
            end

            it "correctly formats a string" do
                expect(number_to_currency('hello')).to eq(' £ he,llo.00')
            end

            it "uses delimiters for a very large number" do
                expect(number_to_currency(1000)).to eq(' £ 1,000.00')
            end

            it "does not have delimiters for small numbers" do
                expect(number_to_currency(200)).to eq(' £ 200.00')
            end
        end

        context "using custom options" do 
            it "allows changing the :unit" do
                expect(number_to_currency(2, :unit => '$')).to eq('$2.00')
            end
            it "allows changing the :precision" do
                expect(number_to_currency(4 , :precision => 4)).to  eq(' £ 4.0000')
            end

            it "omits the separator if the :precision is 0" do 
                expect(number_to_currency(56 , :precision => 0)).to eq(' £ 56')    
            end

            it "allows changing the :delimiter" do 
                expect(number_to_currency(4000 , :delimiter => '/')).to eq(' £ 4/000.00')
            end

            it "allows changing the separator" do 
                expect(number_to_currency(5000 , :separator => '-')).to eq(' £ 5,000-00')
            end

            it "correctly formats using multiple options" do
                expect(number_to_currency(50000 ,:delimiter=> "{" , :precision => 5)).to eq(' £ 50{000.00000')
            end
        end
    end

end