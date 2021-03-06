class MessagesController < ApplicationController
  def create
    message = current_user.messages.new(message_params)
    if message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(message.group) }
        format.json { render json: message.json_message}
      end
    else
      redirect_to group_messages_path(message.group.id), alert: 'メッセージを投稿できませんでした'
    end
  end

  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
    @messages = @group.messages
    @users = @group.users
    respond_to do |format|
      format.html { render :index }
      format.json {
        messages = @messages.includes(:user).map do |message|
          message.json_message
        end
        render json: messages
      }
    end
  end


  private
  def message_params
    params.require(:message).permit(:content, :image).merge(group_id: params[:group_id])
  end
end
