class Operation < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :source

  enumerize :operation_type, in: [:debet, :credit], scope: true

  validates :operation_type, presence: true
  validates :description, presence: true
  validates :amount, presence: true
  validates :source_id, presence: true
end
