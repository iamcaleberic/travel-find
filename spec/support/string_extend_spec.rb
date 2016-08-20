describe 'String' do
    describe '#titleize' do
        it "capitalizes each word in a String" do
            expect("i am caleb".titleize).to eq("I Am Caleb")
        end

        it "works with single-word strings" do
            expect('killjoys'.titleize).to eq('Killjoys')
        end

        it "capitalizes all uppercase strings" do
            expect('DARKMATTER'.titleize).to eq('Darkmatter')
        end

        it "capitalizes mixed-case strings" do
            expect("dEAD Of sUMMeR".titleize).to eq('Dead Of Summer')
        end
    end
  
    describe "#blank?" do
    
        it "returns true if string is empty" 

        it "returns true if String contains only spaces"

        it "returns true of string contains only tabs"
        # \t\t\t

        it "returns true if string contains only spaces and tabs"

        it "returns false if string contains a letter"

        it "returns false if string contains a number"
    end 
end