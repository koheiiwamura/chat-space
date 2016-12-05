class MessagesController < ApplicationController
  def create
    message = current_user.messages.new(message_params)
    if message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(message.group) }
        format.json { render json: message.json_message}
      end
    else
      flash[:alert] = "メッセージを投稿できませんでした"
      redirect_to group_messages_path(message.group.id)
    end
  end

  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
    @messages = Message.where(group_id: @group.id).limit(5).order("created_at DESC")
    @users = @group.users
  end


  private
  def message_params
    params.require(:message).permit(:content).merge(group_id: params[:group_id])
  end
end
