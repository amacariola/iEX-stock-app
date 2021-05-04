require 'rails_helper'

RSpec.describe Transaction, type: :model do

   it "Should create a transaction record" do
     user = create(:user, email:"new@new.com")
     stock = create(:stock)
     s=create(:user_stock, user_id: user.id, stock_id: stock.id)
     expect(s.errors).to_not be_present
   end      
  
   it "Should delete a transaction record" do 
     user = create(:user, email:"todedeleted@something.com")
     stock = create(:stock)
     s = create(:user_stock, user_id: user.id, stock_id: stock.id)
     expect(s.errors).to_not be_present
   end 

end
