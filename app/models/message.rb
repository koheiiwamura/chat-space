class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader

  def json_message
    {user_name: user.name, created_at: created_at.to_s(:datetime), content: content, image: image.url}
  end
end
