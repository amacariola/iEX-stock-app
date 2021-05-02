require 'rails_helper'

RSpec.describe Role, type: :model do

  before(:all) do
    @role1 = create(:role)
  end

  context "Validations" do

    it "1. is valid with valid attributes" do
      expect(@role1).to be_valid
      expect(@role1).to be_truthy
    end

    it "2. is not valid without name" do
      role2 = build(:role, name: nil)
      expect(role2).to_not be_valid
      expect(role2.errors).to be_present
      expect(role2.errors.to_h.keys).to include(:name)
    end

    it "3. is not valid without description" do
      role2 = build(:role, description: nil)
      expect(role2).to_not be_valid
      expect(role2.errors).to be_present
      expect(role2.errors.to_h.keys).to include(:description)
    end

  end

end
