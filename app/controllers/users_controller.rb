class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  layout :select_layout

  # Protect these actions behind an admin login
  # before_filter :admin_required, :only => [:suspend, :unsuspend, :destroy, :purge]
  before_filter :find_user, :only => [:suspend, :unsuspend, :destroy, :purge]
  skip_before_filter :login_required, :only => [:new, :create, :activate, :forgot_password,:reset_password]

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    @user.register! if @user && @user.valid?
    success = @user && @user.valid?
    if success && @user.errors.empty?
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
    respond_to do |format|
      format.html
    end
  end


  def show
    respond_to do |format|
      format.html
    end
  end


  def update
    respond_to do |format|
      @user = current_user
      if @user && @user.authenticated?(params[:current_password])
        
        if @user.update_attributes(params[:user])
          format.html { redirect_to @user }
          flash[:notice] = "Update Successful"   
        else
          flash[:error] = "Profile could not be updated"
          format.html {  render :action => "edit" }
        end
      else
        flash[:error] = "please re-enter your current password"
        format.html {  render :action => "edit" }
      end
    end  
  end
  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end

  def suspend
    @user.suspend! 
    redirect_to users_path
  end

  def unsuspend
    @user.unsuspend! 
    redirect_to users_path
  end

  def destroy
    @user.delete!
    redirect_to users_path
  end

  def purge
    @user.destroy
    redirect_to users_path
  end
  
  # There's no page here to update or destroy a user.  If you add those, be
  # smart -- make sure you check that the visitor is authorized to do so, that they
  # supply their old password along with a new one to update it, etc.

  def forgot_password
    if request.get?
      respond_to do |format|
        format.html
      end
    else request.post?
      respond_to do |format|
        @user = User.find_by_email(params[:user][:email]) if params[:user]
        if @user
          @user.forgot_password
          if @user.save
            format.html { redirect_to posts_path }
            flash[:notice] = "A password reset link has been sent to :#{params[:user][:email]}"
          else
            format.html
            flash[:error] = "There was some error in processing your request"
          end
        else
          format.html
          flash[:error] = "Could not find a user with that email id!"
        end
      end
    end
  end


  def reset_password
    @user = User.find_by_password_reset_code(params[:code])
    if request.get?
      respond_to do |format|
        format.html
      end
    else request.post?
      respond_to do |format| 
        if @user
          if((params[:user][:password]) && (params[:user][:password_confirmation]))
            self.current_user = @user
            current_user.password = params[:user][:password]
            current_user.password_confirmation = params[:user][:password_confirmation]
            if current_user.save 
              flash[:notice]= "Password reset successfully"
              format.html { redirect_to posts_path }
            else
              format.html
              flash[:error] = "Password Mismatch"
            end
          else
            format.html
            flash[:error] = "Dunno what to do!"
          end
        end
      end
    end
  end
protected
  def find_user
    @user = User.find(params[:id])
  end
  private
  def select_layout
    if ['new', 'forgot_password', 'reset_password'].include? action_name
      'account'
    else
      'application'
    end
  end
end
