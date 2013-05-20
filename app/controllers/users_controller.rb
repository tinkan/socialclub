class UsersController < ApplicationController

before_filter :authenticate_user!

 
 
   
  def show

    @user = current_user
	
  end
  
  def sign_out
        user = User.find(@current_user.id)
        user.last_log = Time.now
        user.save!
       end
end
