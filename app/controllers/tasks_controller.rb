class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.all
    @task = Task.find(params[:id])
  end

  def delete
    Task.find(params[:id]).delete
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    redirect_to tasks_url, :notice => "successfully updated task"
  end

  def create
    @task = params[:task]
    Task.create(@task)
    redirect_to tasks_url, :notice => "successfully created task"
  end
end
