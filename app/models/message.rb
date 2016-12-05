class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :content, presence: true

  def json_message
    {user_name: user.name, created_at: created_at.to_s(:datetime), content: content}
  end
end
