module AuthenticatedSystem
  protected
    # Returns true or false if the blogger is logged in.
    # Preloads @current_blogger with the blogger model if they're logged in.
    def logged_in?
      !!current_blogger
    end

    # Accesses the current blogger from the session. 
    # Future calls avoid the database because nil is not equal to false.
    def current_blogger
      @current_blogger ||= (login_from_session || login_from_basic_auth || login_from_cookie) unless @current_blogger == false
    end

    # Store the given blogger id in the session.
    def current_blogger=(new_blogger)
      session[:blogger_id] = new_blogger ? new_blogger.id : nil
      @current_blogger = new_blogger || false
    end

    # Check if the blogger is authorized
    #
    # Override this method in your controllers if you want to restrict access
    # to only a few actions or if you want to check if the blogger
    # has the correct rights.
    #
    # Example:
    #
    #  # only allow nonbobs
    #  def authorized?
    #    current_blogger.login != "bob"
    #  end
    def authorized?
      logged_in?
    end

    # Filter method to enforce a login requirement.
    #
    # To require logins for all actions, use this in your controllers:
    #
    #   before_filter :login_required
    #
    # To require logins for specific actions, use this in your controllers:
    #
    #   before_filter :login_required, :only => [ :edit, :update ]
    #
    # To skip this in a subclassed controller:
    #
    #   skip_before_filter :login_required
    #
    def login_required
      authorized? || access_denied
    end

    # Redirect as appropriate when an access request fails.
    #
    # The default action is to redirect to the login screen.
    #
    # Override this method in your controllers if you want to have special
    # behavior in case the blogger is not authorized
    # to access the requested action.  For example, a popup window might
    # simply close itself.
    def access_denied
      respond_to do |format|
        format.html do
          store_location
          flash[:notice] = "Please Login first"
          redirect_to login_path
        end
        format.any do
          request_http_basic_authentication 'Web Password'
        end
      end
    end

    # Store the URI of the current request in the session.
    #
    # We can return to this location by calling #redirect_back_or_default.
    def store_location
      session[:return_to] = request.request_uri
    end

    # Redirect to the URI stored by the most recent store_location call or
    # to the passed default.
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    # Inclusion hook to make #current_blogger and #logged_in?
    # available as ActionView helper methods.
    def self.included(base)
      base.send :helper_method, :current_blogger, :logged_in?
    end

    # Called from #current_blogger.  First attempt to login by the blogger id stored in the session.
    def login_from_session
      self.current_blogger = Blogger.find_by_id(session[:blogger_id]) if session[:blogger_id]
    end

    # Called from #current_blogger.  Now, attempt to login by basic authentication information.
    def login_from_basic_auth
      authenticate_with_http_basic do |username, password|
        self.current_blogger = Blogger.authenticate(username, password)
      end
    end

    # Called from #current_blogger.  Finaly, attempt to login by an expiring token in the cookie.
    def login_from_cookie
      blogger = cookies[:auth_token] && Blogger.find_by_remember_token(cookies[:auth_token])
      if blogger && blogger.remember_token?
        cookies[:auth_token] = { :value => blogger.remember_token, :expires => blogger.remember_token_expires_at }
        self.current_blogger = blogger
      end
    end
end
