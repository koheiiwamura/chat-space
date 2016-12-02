class MessagesController < ApplicationController
  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@message.group), notice: "メッセージを投稿できました"
    else
      redirect_to group_messages_path(@message.group), alert: "メッセージを投稿できませんでした"
    end
  end

  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
    @messages = Message.where(group_id: @group.id).order("created_at DESC")
    @users = @group.users
  end


  private
  def message_params
    params.require(:message).permit(:content).merge(group_id: params[:group_id])
  end
end
