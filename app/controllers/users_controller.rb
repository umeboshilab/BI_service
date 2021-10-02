class UsersController < ApplicationController
  before_action :confirm_current_user_is_logged_in, only: %i[join_group update]
  def create
    user = User.new(user_params)
    error_msgs = []
    
    ActiveRecord::Base.transaction do
      if !user.save
        error_msgs << user.errors.full_messages
        raise ActiveRecord::Rollback
      end
      if params[:user][:is_host]
        host_user = HostUser.new({user_id: user.id, image: 'no_icon.png'})
        if !host_user.save
          error_msgs << host_user.errors.full_messages
          raise ActiveRecord::Rollback
        end
      end
    end

    if error_msgs.present?
      redirect_to new_user_path, flash: {
        user: user,
        error_messages: error_msgs.flatten
      }
    else
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def join_group
  end

  def update
    group = nil
    error_msgs = []

    begin
      ActiveRecord::Base.transaction do
        group = Group.lock.find_by(code: params[:group_code])
        if group.blank?
          error_msgs << 'グループが存在しません'
          raise ActiveRecord::Rollback
        end
        @current_user.update!(group_id: group.id)
      end
    rescue ActiveRecord::RecordInvalid => e
      error_msgs << e.record.errors.full_messages
    end
    if error_msgs.blank?
      flash[:notice] = "「#{group.name}」に参加しました"
      redirect_to service_path
    else
      redirect_to users_join_group_path, flash: {
        error_messages: error_msgs.flatten,
      }
    end
  end

  def show
  end

  def new
    @user = User.new(flash[:user])
  end

  def signin
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
