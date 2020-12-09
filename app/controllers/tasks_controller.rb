class TasksController < ApplicationController
  before_action :get_user, except: :dashboard
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @user.tasks.order("created_at DESC")
  end

  def dashboard
    @dashboard = Task.where(ispublic: true)
    
  end
  
  
  def show
  end
 
  def new
    @task = @user.tasks.build
  end
 
  def edit
  end

  def create
    @task = @user.tasks.build(task_params)
      if @task.save
        redirect_to user_tasks_path(@user)  
      else
        render 'new'
      end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to user_tasks_path(@user), notice: 'task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to user_tasks_path(@user)
  end

private
 
  def get_user
    @user = User.find(params[:user_id])
  end   

  def set_task
    @task = @user.tasks.find(params[:id])
  end 

  def task_params
    params.require(:task).permit(:task_name, :task_descption, :start_date, :due_date, :estimate_time, :priority_scale, :status, :ispublic)
  end
end