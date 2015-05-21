class SshActionsController < ApplicationController
  def testConnection
    puts 1111111
    puts params[:name]
    puts params[:password]
    require 'rubygems'
    require 'net/ssh'
    require 'net/ssh/shell'
    puts 1111111
   # render json: { name: params[:name], pass: params[:password]}
    passp = SshConnection.find_by name: params[:name]
    serv = passp.ip
    login = passp.login
    begin
      Net::SSH.start(serv, login, :password => params[:password]) do |ssh|
          qwes = ssh.exec!(strConvert("mfree")).split("\n")[0]
      if(qwes.size != 0)
        render json: { success: true }
       # format.json { success: true  }
      end
    end
    rescue
      render json: { success: false }
      #format.json { success: false }
    end
  end
  def show
    
  end
  def runCommand
    serv = SshConnection.find_by name: params[:name]
    #puts 0
   # puts params[:password]
   # puts params[:command]["procNum"]
    str = "epkrun -np " + params[:command]["procNum"].to_s + " -maxtime " + params[:command]["maxTime"].to_s + " -passp " + params[:command]["passportName"].to_s + " -tsk " + params[:command]["taskName"].to_s
    #puts str
    begin
    Net::SSH.start(serv.ip, serv.login, :password => params[:password]) do |ssh|
      ssh.shell do |sh|
        begin
          asd = sh.execute 'cd ' + params[:command]["dir"].to_s
          asd = sh.execute 'pwd'
          puts asd
          @res = sh.execute str  
          sh.wait!
          puts 1111
          sh.execute! 'exit'
          puts 2222
        rescue
          puts 3333
          render json: {  success: true, info: @res}
        end 
      end  
        puts 4444444
       render json: {  success: true, info: @res}  
    end
   rescue
     puts 55555555
     render json: {  success: true, info: 'Ok'} 
    #     puts @res  
    # render json: { success: false, serv_name: serv.name }
   end
     
  end
  def dell_task
    puts 0
    puts params[:password]
    puts params[:name]
    if (params[:type_dell] == 'queue')
      str_dell = 'mqdel'
    else
      str_dell = 'mkill'
    end
    str_dell+= ' ' + params[:task_name]
    serv = SshConnection.find_by name: params[:name]
    puts serv.ip
    puts serv.login
    puts(str_dell)
    begin
     # Net::SSH.start('172.16.36.128', 'user', :password => 'user') do |ssh|
      Net::SSH.start(serv.ip, serv.login, :password => params[:password]) do |ssh|
        res = ssh.exec!(strConvert(str_dell)).split("\n")
        puts(res)
        render json: { success: true, info: res}
      end
    rescue
      #puts (res)
      render json: { success: false, info: res }
    end
  end
  def get_outputs
    #puts params

    serv = SshConnection.find_by name: params[:name]
    #puts serv
    str = 'cat ' + params[:task_name].gsub('_', '.') + '/manager.log'
    #puts str

    begin
      # Net::SSH.start('172.16.36.128', 'user', :password => 'user') do |ssh|
       Net::SSH.start(serv.ip, serv.login, :password => params[:password]) do |ssh|
        #puts 123
        res = ssh.exec!(strConvert(str)).split("\n")
       # puts(res)
        render json: { success: true, info: res}
       end
     rescue
       #puts (res)
       render json: { success: false, info: res }
     end
  end
  def getInfo
    # puts 123
    #   puts params[:name]
    #   puts params[:password]
    serv = SshConnection.find_by name: params[:name]
    # puts serv.login
    begin
    Net::SSH.start(serv.ip, serv.login, :password => params[:password]) do |ssh|
      ress = ssh.exec!(strConvert("mqinfo"))
      res = ress.split("\n")
      run_tasks = {}
      queue_tasks = {}
      block_tasks = {}
      proc_info = ''
      user_info = ''

      find_free_proc = false
      find_queue = false     
        Task.all.each do |tsk| 
          if !(ress.include? tsk.name) && tsk.status_suppz != "finished"
            tsk.status_suppz = "finished"
            tsk.save
          end
        end

      for i in 0..res.size       
        if res[i].present?
          if (res[i].include?(serv.login) && res[i].include?("~~~"))
            block_tasks[i] = res[i]    
            task_name = res[i].split(' : ')[0].strip
            task = Task.find_or_create_by(name: task_name)  
            templ = Template.where('taskName LIKE ?', "%#{task_name.split('.')[0] +'.'+ task_name.split('.')[1]}%")[0].dir    
            begin
              task.stdout_rez = ssh.exec!(strConvert("cat " + templ + "/stdout.rez")).split("\n")
            rescue
              task.stdout_rez = ''
            end           
            begin
              task.work_status = ssh.exec!(strConvert("cat " + templ + "/work.status")).split("\n")
            rescue
              task.work_status = ''
            end           
            task.mqinfo = res[i]
            begin 
               task.errors_suppz = ssh.exec!(strConvert("cat " + templ+ "/" + task_name + "/errors")).split("\n")
            rescue
               task.errors_suppz = ''
            end
            begin
              task.manager_log = ssh.exec!(strConvert("cat " + templ+ "/" + task_name + "/manager.log")).split("\n")
            rescue
              task.manager_log = ''
            end
            begin
              task.output_suppz = ssh.exec!(strConvert("cat " + templ+ "/" + task_name + "/output")).split("\n")
              task.output_status_suppz = task.output_suppz[-1]
            rescue
              task.output_suppz = ''
              task.output_status_suppz = ''
            end
            task.status_suppz = "block"
            task.save
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
              task_name = res[i].split(' : ')[0].strip
              task = Task.find_or_create_by(name: task_name) 
              templ = Template.where('taskName LIKE ?', "%#{task_name.split('.')[0] +'.'+ task_name.split('.')[1]}%")[0].dir      
              begin
              task.stdout_rez = ssh.exec!(strConvert("cat " + templ + "/stdout.rez")).split("\n")
            rescue
              task.stdout_rez = ''
            end           
            begin
              task.work_status = ssh.exec!(strConvert("cat " + templ + "/work.status")).split("\n")
            rescue
              task.work_status = ''
            end           
            task.mqinfo = res[i]
            begin 
               task.errors_suppz = ssh.exec!(strConvert("cat " + templ+ "/" + task_name + "/errors")).split("\n")
            rescue
               task.errors_suppz = ''
            end
            begin
              task.manager_log = ssh.exec!(strConvert("cat " + templ+ "/" + task_name + "/manager.log")).split("\n")
            rescue
              task.manager_log = ''
            end
            begin
              task.output_suppz = ssh.exec!(strConvert("cat " + templ+ "/" + task_name + "/output")).split("\n")
              task.output_status_suppz = task.output_suppz[-1]
            rescue
              task.output_suppz = ''
              task.output_status_suppz = ''
            end
              task.status_suppz = "queue"
              task.save
            else
              run_tasks[i] = res[i]
              task_name = res[i].split(' : ')[0].strip
              task = Task.find_or_create_by(name: task_name)  
              templ = Template.where('taskName LIKE ?', "%#{task_name.split('.')[0] +'.'+ task_name.split('.')[1]}%")[0].dir 
             begin
              task.stdout_rez = ssh.exec!(strConvert("cat " + templ + "/stdout.rez")).split("\n")
            rescue
              task.stdout_rez = ''
            end           
            begin
              task.work_status = ssh.exec!(strConvert("cat " + templ + "/work.status")).split("\n")
            rescue
              task.work_status = ''
            end           
            task.mqinfo = res[i]
            begin 
               task.errors_suppz = ssh.exec!(strConvert("cat " + templ+ "/" + task_name + "/errors")).split("\n")
            rescue
               task.errors_suppz = ''
            end
            begin
              task.manager_log = ssh.exec!(strConvert("cat " + templ+ "/" + task_name + "/manager.log")).split("\n")
            rescue
              task.manager_log = ''
            end
            begin
              task.output_suppz = ssh.exec!(strConvert("cat " + templ+ "/" + task_name + "/output")).split("\n")
              task.output_status_suppz = task.output_suppz[-1]
            rescue
              task.output_suppz = ''
              task.output_status_suppz = ''
            end
              task.status_suppz = "run"
              task.save
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
   
     def strConvert(str)
      strExport = "bash -l -c '" + str + "'" 
    end
end
