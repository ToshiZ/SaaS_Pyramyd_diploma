class SshConnectionsController < ApplicationController
  before_action :set_ssh_connection, only: [:show, :edit, :update, :destroy]

  # GET /ssh_connections
  # GET /ssh_connections.json
  def index
    @ssh_connections = SshConnection.all
  end

  # GET /ssh_connections/1
  # GET /ssh_connections/1.json
  def show
  end

  # GET /ssh_connections/new
  def new
    @ssh_connection = SshConnection.new
  end

  # GET /ssh_connections/1/edit
  def edit
  end

  # POST /ssh_connections
  # POST /ssh_connections.json
  def create
    @ssh_connection = SshConnection.new(ssh_connection_params)

    respond_to do |format|
      if @ssh_connection.save
        format.html { redirect_to @ssh_connection, notice: 'Ssh connection was successfully created.' }
        format.json { render :show, status: :created, location: @ssh_connection }
      else
        format.html { render :new }
        format.json { render json: @ssh_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ssh_connections/1
  # PATCH/PUT /ssh_connections/1.json
  def update
    respond_to do |format|
      if @ssh_connection.update(ssh_connection_params)
        format.html { redirect_to @ssh_connection, notice: 'Ssh connection was successfully updated.' }
        format.json { render :show, status: :ok, location: @ssh_connection }
      else
        format.html { render :edit }
        format.json { render json: @ssh_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ssh_connections/1
  # DELETE /ssh_connections/1.json
  def destroy
    @ssh_connection.destroy
    respond_to do |format|
      format.html { redirect_to ssh_connections_url, notice: 'Ssh connection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def testConnection
    puts "asdasd"
    require 'rubygems'
      require 'net/ssh'
      passp = SshConnection.find(params[:name])
      serv = params[:sshIp]
      login = params[:sshLogin]
      begin
        Net::SSH.start(serv, login, :password => params[:sshPass]) do |ssh|
            qwes = ssh.exec!(strConvert("mfree")).split("\n")[0]
      if(qwes.size != 0)
       #  format.html { render :edit }
       # format.json { render (:json => { success: true },
       #    :status => :ok)}
      end
    end
    rescue
      #render json: { success: false }
      # format.html { render :edit }
      # format.json { render (:json => { success: false },
      #     :status => :unprocessable_entity)}
    end
  end
    def get_info
    serv = SshConnection.find(params[:name])
    begin
    Net::SSH.start(serv.address, serv.login, :password => params[:passwd]) do |ssh|
      res = ssh.exec!(strConvert("mqinfo")).split("\n")
      
      
      run_tasks = {}
      queue_tasks = {}
      block_tasks = {}
      proc_info = ''
      user_info = ''

      find_free_proc = false
      find_queue = false
      

      for i in 0..res.size
        if res[i].present?
          if (res[i].include?(serv.login) && res[i].include?("~~~"))
            block_tasks[i] = res[i]
          end
          if (res[i].include?("Free: "))
            proc_info = res[i]
          end
          if(res[i].split.count == 8 && res[i].include?(serv.login))
            user_info = res[i]
          end
          if(res[i].split.count == 10 && res[i].include?(serv.login) && !res[i].include?("~~~"))
            if(res[i].include?("~") )
              queue_tasks[i] = res[i]
            else
              run_tasks[i] = res[i]
            end
          end
        end
      end
      
      if (queue_tasks.empty?)
        queue_tasks = 0;
      end
      if (block_tasks.empty?)
        block_tasks = 0;
      end
      if (run_tasks.empty?)
        run_tasks = 0;
      end

      render json: {  success: true,
                      proc_info: proc_info,
                      user_info: user_info,
                      block_tasks: block_tasks,
                      queue_tasks: queue_tasks,
                      run_tasks: run_tasks,
                      serv_name: serv.name }
    end
    rescue
    render json: { success: false,
                  serv_name: serv.name }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ssh_connection
      @ssh_connection = SshConnection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ssh_connection_params
      params.require(:ssh_connection).permit(:name, :ip, :login)
    end
     def strConvert(str)
      strExport = "bash -l -c '" + str + "'" 
    end
end
