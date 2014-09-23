class Api::TasksController < Api::BaseController
  #before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_task_list, only: [:index , :create ,:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    #@tasks = Task.all
    tasks = @task_list.tasks.all
    render :json => tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    #@task = Task.new(task_params)
    task = @task_list.tasks.create!(task_params)
    render json: task
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    task = @task_list.tasks.find(params[:id])
    task.update_attributes(task_params)
    render nothing: true
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task_list.tasks.find(params[:id]).destroy
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_task_list
      @task_list = TaskList.find(params[:task_list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :start, :end, :assignee_id, :list_id)
    end
end
