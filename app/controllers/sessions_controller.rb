# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController

  # render new.rhtml
  def new
   
  end

  def create
    self.current_blogger = Blogger.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_blogger.remember_me unless current_blogger.remember_token?
        cookies[:auth_token] = { :value => self.current_blogger.remember_token , :expires => self.current_blogger.remember_token_expires_at }
      end
      redirect_to('/posts')
      flash[:notice] = "Logged in successfully"
    else
      redirect_to('/login')
    flash[:notice] = "Incorrect username/password"
    
    end
  end

  def destroy
    self.current_blogger.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/home/hello')
  end
end
