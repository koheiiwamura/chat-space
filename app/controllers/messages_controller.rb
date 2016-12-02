class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to action: :index, notice: "メッセージを投稿できました"
    else
      flash[:alert] ="投稿できませんでした"
      redirect_to action: :index, alert: "メッセージを投稿できませんでした"
    end
  end

  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
    @messages = Message.where(group_id: @group.id)
    @users = @group.users
  end


  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
