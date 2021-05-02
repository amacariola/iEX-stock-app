FactoryBot.define do
  factory :administrator do
    email { "MyString" }
    password_digest { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    remember_token { "MyString" }
    remember_token_expires_at { "2021-05-02 00:55:34" }
  end

  
    factory :user do
        name {"Haruna-Kai"}
        email {"ijnharunakai@ijn.com"}
        password { "123465"}
        role
    end

    factory :role do
        name {"broker"}
        description {"gets stocks"}
    end

    factory :stock do
        ticker {"SAMPL"}
        name {"SAMPLE STOCK"}
        latest_price {"300"}      
    end

    factory :user_stock do
        user_id {"1"}
        stock_id {"1"}
    end

end


