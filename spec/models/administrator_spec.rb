require 'rails_helper'

RSpec.describe Administrator, type: :model do
  
   it "1. Creates the administrator account" do
     @administrator = create(:administrator)
     expect(@administrator.errors).to_not be_present
   end

   it "2.Update the Admin account" do
     newname = build(:administrator)
     updatedname = newname.update(first_name:"New Name")
     expect(updatedname).to eq(true)  
   end

   it "3. Deletes the admin account" do 
     account = build(:administrator)
     delete = account.destroy
     expect(delete.errors).to_not be_present
   end

   context "Validations" do
     
     before(:all) do
       @administrator = create(:administrator, remember_token_expires_at: Time.now )
     end

     it "1.1 Admin account valid and passed" do 
       expect(@administrator).to be_valid
       expect(@administrator).to be_truthy
     end

   end

end
