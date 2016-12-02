module ApplicationHelper
  def first_message(group)
    group.messages.first
  end
end
