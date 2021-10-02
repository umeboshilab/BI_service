class TasksController < ApplicationController
  before_action :confirm_current_user_belongs_to_group
  before_action :confirm_current_user_is_host

  def create
    host_user = @current_user.host_user

    @task = Task.new(task_params)
    @task[:host_user_id] = host_user.id
    error_msgs = []
    begin
      ActiveRecord::Base.transaction do
        if Group.lock.find_by(id: @current_user.group_id).blank?
          error_msgs << 'グループが存在しないか，削除されました'
          raise ActiveRecord::Rollback
        end

        request = Request.lock.find_by(id: @task.request_id)
        if request.blank?
          error_msgs << 'リクエストが存在しないか，削除されました'
          raise ActiveRecord::Rollback
        end
        if request.group_id != @current_user.group_id
          error_msgs << '不正なアクセスです'
          raise ActiveRecord::Rollback
        end
        request.update!({isChecked: true})
        @task[:group_id] = @current_user.group_id
        @task.save!
      end
    rescue ActiveRecord::RecordInvalid => e
      error_msgs << e.record.errors.full_messages
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
    task = nil
    error_msgs = []
    begin
      ActiveRecord::Base.transaction do
        if Group.lock.find_by(id: @current_user.group_id).blank?
          error_msgs << 'グループが存在しないか，削除されました'
          raise ActiveRecord::Rollback
        end

        task = Task.lock.find_by(id: params[:id])
        if task.blank?
          error_msgs << 'タスクが存在しないか，削除されました'
          raise ActiveRecord::Rollback
        end
        if task.group_id != @current_user.group_id
          error_msgs << '不正なアクセスです'
          raise ActiveRecord::Rollback
        end
        task.update!(task_update_params)
      end
    rescue ActiveRecord::RecordInvalid => e
      error_msgs << e.record.errors.full_messages
    end
    if error_msgs.blank?
      flash[:notice] = "#{task.request.title}を完了済みタスクに登録しました"
      redirect_to tasks_done_path
    else
      redirect_to service_path, flash: {
        task: task,
        error_messages: error_msgs.flatten
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
    if @current_user.host_user.blank?
      flash[:notice] = "管理者権限が必要です"
      redirect_to service_path unless @current_user.host_user.present? 
    end
  end
end
