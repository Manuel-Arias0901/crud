class Product < ApplicationRecord
    belongs_to :tipo
    validates :name, :description, :price, presence: true
end
