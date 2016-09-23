class Source < ApplicationRecord
  belongs_to :user
  has_many :operations

  delegate :family, to: :user, allow_nil: true

  validates :name, presence: true
end
