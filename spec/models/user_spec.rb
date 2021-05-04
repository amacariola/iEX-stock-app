require 'rails_helper'

RSpec.describe User, type: :model do

  it "1-1 Creates a broker account" do
     @role = create(:role)
     broker = create(:user, name: "Taihou",email: "ijntaihou@ijn.com", role: @role)
     expect(broker).to be_valid
     expect(broker.errors).to_not be_present
  end
  
  it "1-2 Update the password of user" do 
     user = build(:user)
     updatepass = user.update(password:"newpassword",password_confirmation:"newpassword")
     expect(updatepass).to eq(true)
  end
  
  it "1-3 Delete the user account" do
     user = build(:user)
     delete = user.destroy
     expect(delete.errors).to_not be_present
  end


  context "Validations" do
    
    before(:all) do
      @role1 = create(:role)
      @user1 = create(:user, role: @role1)
    end 


    it "1. is valid with valid attributes" do
      expect(@user1).to be_valid
      expect(@user1).to be_truthy
    end

    it "2. is not valid without name" do
      user2 = build(:user, name: nil)
      expect(user2).to_not be_valid
      expect(user2.errors).to be_present
      expect(user2.errors.to_h.keys).to include(:name)
    end

    it "3. is not valid without email" do
      user2 = build(:user, email: nil)
      expect(user2).to_not be_valid
      expect(user2.errors).to be_present
      expect(user2.errors.to_h.keys).to include(:email)
    end



  end
end
