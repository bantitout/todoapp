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
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @task = @user.tasks.build(task_params)
    
    respond_to do |format|
      if @task.save
        @tasks = @user.tasks.order("created_at DESC")
        format.js
        format.html { redirect_to user_tasks_path(@user), notice: 'user was successfully created'}  
      else
        format.html { render :new }
      end
    end
  end

  def update
    
    respond_to do |format|
      if @task.update(task_params)
        @tasks = @user.tasks.order("created_at DESC")
        format.html { redirect_to user_tasks_path(@user), notice: 'task was successfully updated.' }            
        format.js
      else
        render :edit      
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html {  redirect_to user_tasks_path(@user) }
      format.json { head :no_content , notice: 'task was successfully updated.' }
      format.js
      
    end
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