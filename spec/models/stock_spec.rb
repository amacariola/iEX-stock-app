require 'rails_helper'

RSpec.describe Stock, type: :model do
 
    before(:all) do
       @samplestock = create(:stock)
    end

   it "1. is valid with valid name and ticker" do
      expect(@samplestock).to be_valid
   end

   it "2. is not valid without name" do 
      samplestock2 = build(:stock, name: nil)
      expect(samplestock2).to_not be_valid
      expect(samplestock2.errors).to be_present
      expect(samplestock2.errors.to_h.keys).to include(:name)
   end
   
   it "3. is not valid without ticker" do 
      samplestock2 = build(:stock, ticker: nil)
      expect(samplestock2).to_not be_valid
      expect(samplestock2.errors).to be_present
      expect(samplestock2.errors.to_h.keys).to include(:ticker)
   end
end
