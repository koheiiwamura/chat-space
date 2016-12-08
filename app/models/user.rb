class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  scope :not_current_user, -> (current_user){ where.not(id: current_user.id) }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :messages

  validates :name, presence: true
end
