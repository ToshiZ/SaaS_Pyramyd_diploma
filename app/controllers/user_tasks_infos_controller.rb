class UserTasksInfosController < ApplicationController
  before_action :set_user_tasks_info, only: [:show, :edit, :update, :destroy]

  # GET /user_tasks_infos
  # GET /user_tasks_infos.json
  def index
    @user_tasks_infos = UserTasksInfo.all
  end

  # GET /user_tasks_infos/1
  # GET /user_tasks_infos/1.json
  def show
  end

  # GET /user_tasks_infos/new
  def new
    @user_tasks_info = UserTasksInfo.new
  end

  # GET /user_tasks_infos/1/edit
  def edit
  end

  # POST /user_tasks_infos
  # POST /user_tasks_infos.json
  def create
    @user_tasks_info = UserTasksInfo.new(user_tasks_info_params)

    respond_to do |format|
      if @user_tasks_info.save
        format.html { redirect_to @user_tasks_info, notice: 'User tasks info was successfully created.' }
        format.json { render :show, status: :created, location: @user_tasks_info }
      else
        format.html { render :new }
        format.json { render json: @user_tasks_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_tasks_infos/1
  # PATCH/PUT /user_tasks_infos/1.json
  def update
    respond_to do |format|
      if @user_tasks_info.update(user_tasks_info_params)
        format.html { redirect_to @user_tasks_info, notice: 'User tasks info was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_tasks_info }
      else
        format.html { render :edit }
        format.json { render json: @user_tasks_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_tasks_infos/1
  # DELETE /user_tasks_infos/1.json
  def destroy
    @user_tasks_info.destroy
    respond_to do |format|
      format.html { redirect_to user_tasks_infos_url, notice: 'User tasks info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_tasks_info
      @user_tasks_info = UserTasksInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_tasks_info_params
      params.require(:user_tasks_info).permit(:task_name, :mqinfo, :stdout_rez, :work_status, :errors, :manager_log, :output)
    end
end
