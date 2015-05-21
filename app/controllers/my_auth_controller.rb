class MyAuthController < ApplicationController
  def index
  	puts 123123
  	puts user_signed_in?
  	#before_action :authenticate_user!
  	if user_signed_in? && current_user.email != 'admin@admin.ru'
  		redirect_to '/user_app/' 
  	elsif user_signed_in? && current_user.email == 'admin@admin.ru'
  		redirect_to '/admin_app/' 
  	else
  		redirect_to '/users/sign_in'
  	end
  end
end
