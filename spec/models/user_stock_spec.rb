require 'rails_helper'

RSpec.describe UserStock, type: :model do

   it "1. Creates a User Stock" do
     s=create(:user_stock)
     expect(s.errors).to_not be_present
   end
  
   
end
