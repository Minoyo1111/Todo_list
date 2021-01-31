class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])
  end 

  def new
    @task = Task.new
  end 

  def create
    @task = Task.new(tasks_params)
    if @task.save
      redirect_to tasks_path, notice: "資料新增成功！"
    else 
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(tasks_params)
      redirect_to tasks_path, notice: "資料更新成功"
    else
      render :edit
    end
  end 

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy if @task
    redirect_to tasks_path, notice: "資料已刪除"
  end

  private
  def tasks_params
    params.require(:task).permit(:title, :description)
  end
end
