class Role < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    has_many :users
end
