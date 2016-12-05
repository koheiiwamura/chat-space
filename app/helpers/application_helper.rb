module ApplicationHelper
  def first_message(group)
    group.messages.order("created_at DESC").first
  end
end
