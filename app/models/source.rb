class Source < ApplicationRecord
  belongs_to :user
  delegate :family, to: :user, allow_nil: true
end
