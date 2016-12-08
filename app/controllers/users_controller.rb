class UsersController < ApplicationController
  def index
    users = User.where('name LIKE ?', "%#{params[:name]}%").not_current_user(current_user)
    respond_to do |format|
      format.json { render json: users }
    end
  end
end
