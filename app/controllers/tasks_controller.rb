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
    if @task.update_attributes(params[:task])
      redirect_to tasks_url, :notice => "successfully updated task"
    else
      render :edit
    end
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to tasks_url, :notice => "successfully created task"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_url, :notice => "successfully deleted task"
  end
end
