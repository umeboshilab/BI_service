class GroupsController < ApplicationController
    before_action :confirm_current_user_is_logged_in
    before_action :confirm_current_user_is_host

    def new
        @group = Group.new(flash[:group])
    end

    def create
        @group = Group.new(group_params)
        @group[:code] = SecureRandom.uuid.slice(0, 23)
        error_msgs = []

        begin
            ActiveRecord::Base.transaction do
                @group.save!
                @current_user.group_id = @group.id
                @current_user.save!
            end
        rescue ActiveRecord::RecordInvalid => e
            error_msgs << e.record.errors.full_messages
        end
        if !@group.save
            redirect_to new_group_path, flash: {
                group: @group,
                error_messages: group.errors.full_messages,
            }
        end
    end

    private

    def group_params
        params.require(:group).permit(:name)
    end

    def confirm_current_user_is_host
        if @current_user.host_user.blank?
          redirect_to login_path unless @current_user.host_user.present? 
        end
    end
end
