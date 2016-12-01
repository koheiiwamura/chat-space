class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update]
  before_action :set_all_group, only: [:show, :index]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to root_path, notice:"新しいグループを作成しました"
  end

  def show
  end

  def edit
  end

  def update
    @group.update(group_params)
    redirect_to root_path, notice:"グループ情報を更新しました"
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def set_all_group
    @groups = Group.all
  end
end
