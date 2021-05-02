require 'rails_helper'

RSpec.describe "UserStocks", type: :request do
  it "1. Renders the User portfolio" do
    get "http://localhost:3000/users/sign_in"
    expect(response).to render_template(:sign_in)
  end

end
