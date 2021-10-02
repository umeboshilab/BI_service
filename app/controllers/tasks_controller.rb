class TasksController < ApplicationController
  before_action :confirm_current_user_belongs_to_group
  before_action :confirm_current_user_is_host

  def create
    host_user = HostUser.find_by(user_id: @current_user.id)
    if !host_user
      flash[:notice] = "Host Userでないためリクエストの承認/拒否はできません"
      redirect_to service_path and return
    end

    @task = Task.new(task_params)
    @task[:host_user_id] = host_user.id
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
    if error_msgs.present?
      redirect_to service_path, flash: {
        task: @task,
        error_messages: error_msgs.flatten
      }
    else
      if @task.isAccepted == true
        flash[:notice] = "「#{@task.request.title}」を承認しました"
        redirect_to service_path
      else
        flash[:notice] = "「#{@task.request.title}」を拒否しました"
        redirect_to tasks_rejected_path
      end
    end
  end

  def task
  end

  def destroy
    task = Task.find(params[:id])
    error_msgs = []
    ActiveRecord::Base.transaction do
      if task.request_id
        if !task.request.update({isChecked: false})
          error_msgs << task.request.errors.full_messages
        end
      else
        error_msgs << 'Request_id is empty'
      end
      if !task.destroy
        error_msgs << task.errors.full_messages
      end
      raise ActiveRecord::Rollback if error_msgs.present?
    end
    if error_msgs.present?
      redirect_to service_path, flash: {
        task: task,
        error_messages: error_msgs.flatten
      }
    else
      flash[:notice] = "「#{task.request.title}」をRequest Listに戻しました"
      redirect_to service_path
    end
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
    task = Task.find(params[:id])
    if task.update(task_update_params)
      flash[:notice] = "#{task.request.title}を完了済みタスクに登録しました"
      redirect_to tasks_done_path
    else
      redirect_to service_path, flash: {
        task: task,
        error_messages: task.errors.full_messages
      }
    end
  end

  def task_params
    params.require(:task).permit(:request_id, :host_user_id, :isAccepted, :comment)
  end

  def task_update_params
    params.require(:task).permit(:host_user_id, :isDone, :comment)
  end

  private

  def confirm_current_user_is_host
    redirect_to login_path unless @current_user.host_user.present? 
  end
end
