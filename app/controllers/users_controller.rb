class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    error_msgs = []
    
    ActiveRecord::Base.transaction do
      if !user.save
        error_msgs << user.errors.full_messages
        raise ActiveRecord::Rollback
      end
      if params.require(:user).permit(:is_host)
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

  def update
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
