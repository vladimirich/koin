class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :family, required: false
  has_many :sources, dependent: :destroy
  has_many :operations, dependent: :destroy

  def all_operations
    Operation.where(user_id: family_user_ids || id)
  end

  def all_sources
    Source.where(user_id: family_user_ids || id)
  end

  def family_user_ids
    family.users.pluck(:id) if family
  end
end
