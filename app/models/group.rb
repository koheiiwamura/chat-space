class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  accepts_nested_attributes_for :user_groups, allow_destroy: true
  has_many :messages

  validates :name, presence: true
end
