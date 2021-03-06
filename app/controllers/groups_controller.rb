class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  before_action :set_all_group, only: [:index]
  before_action :set_users, only: [:edit]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    if @group.save
      redirect_to root_path, notice:'新しいグループを作成しました'
    else
      flash[:alert] = 'グループを作成できませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    @group.update(group_params)
    redirect_to root_path, notice:'グループ情報を更新しました'
  end

  private

  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def set_all_group
    @groups = current_user.groups
  end

  def set_users
    @users = @group.users.not_current_user(current_user)
  end
end
