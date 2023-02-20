require './lib/caesar.rb'

describe "#caesar_cipher" do
    it "returns an encypted string based on integer value" do
        expect(caesar_cipher("abcde", 1)).to eql('bcdef')
    end
    it "differentiates between letter case" do
        expect(caesar_cipher("AbCdE", 1)).to eql('BcDeF')
    end
    it "does not change spaces" do
        expect(caesar_cipher("L m N o P", 1)).to eql('M n O p Q')
    end
    it "wraps alphabet" do
        expect(caesar_cipher("z", 2)).to eql('b')
    end
end