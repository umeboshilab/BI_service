class ApplicationController < ActionController::Base
    before_action :current_user

    private

    def current_user
        return unless session[:user_id]
        @current_user = User.find_by(id: session[:user_id])
    end

    def confirm_current_user_belongs_to_group
        redirect_to login_path if @current_user.nil? || @current_user.group_id.blank?
    end
end
