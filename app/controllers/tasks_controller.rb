class TasksController < ApplicationController
  before_action :authenticate_parent!
  before_action :authenticate_user!, only: []
  after_action :authenticate_user!, only: [:update]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_create_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_update_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_create_params
      params.require(:task).permit(:title, :description, :reward, :parent_id,
                                   status: 'open')
    end

    def task_update_params
      params.require(:task).permit(:title, :description, :reward, :status)
    end
end
