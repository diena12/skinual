class Category < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_ancestry
end
