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

  def update
  end
end
