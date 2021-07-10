class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    error_msgs = []
    ActiveRecord::Base.transaction do
      if !@task.save
        error_msgs << @task.errors.full_messages
      end
      if @task.request_id
        if !@task.request.update({isChecked: true})
          error_msgs << @task.request.errors.full_messages
        end
      else
        error_msgs << 'Request_id is empty'
      end
      raise ActiveRecord::Rollback if error_msgs.present?
    end
    if error_msgs
      redirect_to service_path, flash: {
        task: @task,
        error_messages: error_msgs.flatten
      }
    else
      if @task.isAccepted = 1
        flash[:notice] = "#{@task.request.title}を承認しました"
      else
        flash[:notice] = "#{@task.request.title}を拒否しました"
      end
      redirect_to service_path
    end
  end

  def task
  end

  def delete
  end

  def show
    @tasks = Task.all    
  end

  def index_rejected
    @rejected_tasks = Task.where(isAccepted: 0)
  end

  def index_done
    @done_tasks = Task.where(isDone: 1)
  end

  def update
  end

  def task_params
    params.require(:task).permit(:request_id, :host_user_id, :isAccepted, :comment)
  end
end
