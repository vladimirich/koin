class Family < ApplicationRecord
  has_many :users
  has_many :sources, through: :users
end
