require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  
    it "renders the headers" do
      user = create(:user, email:'ijnkaga@ijn.com')
      mail = UserMailer.welcome_email(user)
      expect(mail.subject).to eq("Welcome to iEX!")
      expect(mail.to).to eq(["ijnkaga@ijn.com"])
      expect(mail.from).to eq(["iexadmin@dispostable.com"])
    end

end
