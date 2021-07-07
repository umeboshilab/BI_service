class ServiceController < ApplicationController
    def index
        @requests = Request.where(isChecked: 0)
        @request = Request.new(flash[:request])
        @tasks = Task.where(isAccepted: 1, isDone: 0)
        @tasks.each do |task|
            p task
        end
    end
end
