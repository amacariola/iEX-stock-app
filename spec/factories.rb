FactoryBot.define do

   factory :administrator do
     email { "test@test.com" }
     password { "testing" }
     password_confirmation {"testing"}
     first_name { "Test" }
     last_name { "Admin" }
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


