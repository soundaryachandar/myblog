# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base 
 include AuthenticatedSystem
  
  before_filter :authorize, :except => :login
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

 

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  session :session_key => '_authenticator_session_id'

protected 
  def authorize
    if (Blogger.find_by_id(session[:blogger_id]) ==  nil)
      flash[:notice] = "Please Log In"
      redirect_to '/login'
    else
      redirect_to '/posts'
    end
  end
end


