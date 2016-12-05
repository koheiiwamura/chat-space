module ApplicationHelper
  def first_message(group)
    group.messages.last
  end
end
