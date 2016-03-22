class TasksController < ApplicationController

   before_action :all_tasks, only: [:index, :create, :update, :destroy]
   before_action :set_tasks, only: [:edit, :update, :destroy]


  def index
    if session[:user_id] == nil
      redirect_to root_url, :notice => "Need to log in!"
    else
      @task = Task.new
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  def new
    @task = Task.new
  end

  def create
    params.permit!
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'task was successfully created.' }
        format.js   {}
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "create" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    params.permit!
    @task.update(params[:task])
  end

  def destroy
    @task.destroy
  end


private

   def set_tasks
      @task = Task.find(params[:id])
   end

   def all_tasks
      @tasks = Task.all
   end



  def task_params
    params.require(:task).permit(:id, :deadline)
  end
end
