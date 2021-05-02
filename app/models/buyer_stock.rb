class BuyerStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock
end
