class PassportController < ApplicationController
	protect_from_forgery
	skip_before_filter :verify_authenticity_token
	def index
	end
	def main
	end
	def main2
	end
	def rr
		render text: "qweqwe" + params[:id]
	end
	def epk
		require 'rubygems'
    	require 'net/ssh'
	   	passp = Passport.find(params[:id])
	    serv = params[:sshIp]
	    login = params[:sshLogin]
	    strexec = "epkrun -np 3 -maxtime 5 -passp " +  passp.fileName + " -tsk " + passp.taskName
	    
	    # if tmplt.np.present? then strexec+= " -np " + tmplt.np.to_s end
	    # strexec+= " -maxtime " + tmplt.maxtime.to_s
	    # if tmplt.quantum.present? then strexec+= " -quantum " + tmplt.quantum.to_s end
	    # if tmplt.restart.present? then strexec+= " -restart" end
	    # if tmplt.stdiodir.present? then strexec+= " -stdiodir " + tmplt.stdiodir end
	    # if tmplt.stdin.present? then strexec+= " -stdin " + tmplt.stdin end
	    # if tmplt.stdout.present? then strexec+= " -stdout " + tmplt.stdout end
	    # if tmplt.stderr.present? then strexec+= " -stderr " + tmplt.stderr end
	    # if tmplt.termtime.present? then strexec+= " -termtime " + tmplt.termtime.to_s end
	    # if tmplt.machinefile.present? then strexec+= " -machinefile " + tmplt.machinefile end

	    # strexec+= " " + tmplt.name + "/" + tmplt.name

	    # if tmplt.argv.present? then strexec+= " " + tmplt.argv end
	    
	    begin
	    	puts(serv, login, params[:sshPass])
		    Net::SSH.start(serv, login, :password => params[:sshPass]) do |ssh|
		    #Net::SSH.start("172.16.36.128", "user", :password =>"user") do |ssh|
		    	puts(1)
		    #   ssh.exec!(strConvert(strexec)) do |channel, stream, data|
  				# 	@result << data if stream == :stdout
  				# end
  			  @result = ssh.exec!(strConvert(strexec))
		      @result.to_s
		      puts(1)
		      puts(serv, login, params[:sshPass])
		      puts(@result)
		      if(@result.size != 0)
		        render json: { success: true, result: @result }
	      end
	    end
	    rescue
	      render json: { success: false }
	    end
  end
   private
    def strConvert(str)
      strExport = "bash -l -c '" + str + "'" 
    end
end
