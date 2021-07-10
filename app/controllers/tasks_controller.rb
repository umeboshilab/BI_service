class TasksController < ApplicationController
  def create
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
end
