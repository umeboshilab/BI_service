class ServiceController < ApplicationController
    before_action :confirm_current_user_belongs_to_group
    def index
        @requests = Request.where(isChecked: 0, group_id: @current_user.group_id)
        @request = Request.new(flash[:request])
        @tasks = Task.where(isAccepted: 1, isDone: 0, group_id: @current_user.group_id)
        @task = Task.new
    end
end
