class Api::TaskListsController < Api::BaseController
  #before_action :check_owner, only: [:show, :update, :destroy]

  def index
    

    # page = params[:page].to_i
    # page_size = params[:page_size].to_i

    task_lists = TaskList.all
    # binding.pry


    #task_lists = TaskList.paginate(:page => params[:page], :per_page => 3)
    #task_lists_count = task_lists.count
    # render json: @users, root: :users, each_serializer: UserSerializer, meta: { total: @users_count }
    #render json: current_user.task_lists
    render json: task_lists #, meta: { total: task_lists_count }
  end

  def show
    render json: task_list
  end

  def create
    #list = current_user.task_lists.create!(safe_params)
    list = TaskList.create!(safe_params)
    render json: list
  end

  def update
    task_list.update_attributes(safe_params)
    render nothing: true
  end

  def destroy
    task_list.destroy
    render nothing: true
  end

  private
  def check_owner
    permission_denied if current_user != task_list.owner
  end

  def task_list
    @task_list ||= TaskList.find(params[:id])    
  end

  def safe_params
    params.require(:list).permit(:title,:page,:page_size)
  end
end

