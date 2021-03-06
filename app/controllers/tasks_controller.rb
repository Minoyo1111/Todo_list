class TasksController < ApplicationController
  def index
    @tasks = Task.all.order("created_at DESC")

  end

  def show
    @task = Task.find(params[:id])
  end 

  def new
    @task = Task.new
  end 

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: t("tasks.create_success!")
    else 
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: t("tasks.update_finish")
    else
      render :edit
    end
  end 

  def destroy
    @task = Task.find(params[:id])
    @task.destroy if @task
    redirect_to tasks_path, notice: t("tasks.delete_finish")
  end

  private
    def task_params
      params.require(:task).permit(:title, :description)
    end
end
