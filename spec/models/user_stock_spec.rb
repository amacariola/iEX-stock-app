require 'rails_helper'

RSpec.describe UserStock, type: :model do

   it "1. Creates a User Stock" do
     user = create(:user, email:"new@new.com")
     stock = create(:stock)
     s=create(:user_stock, user_id: user.id, stock_id: stock.id)
     expect(s.errors).to_not be_present
   end
  
   it "2. deletes a User Stock" do
     user = create(:user, email:"tobedeleted@something.com")
     stock = create(:stock)
     s=create(:user_stock, user_id: user.id, stock_id: stock.id)
     delete = s.delete
     expect(delete.errors).to_not be_present
   end
   
end
