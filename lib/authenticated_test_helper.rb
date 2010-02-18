module AuthenticatedTestHelper
  # Sets the current blogger in the session from the blogger fixtures.
  def login_as(blogger)
    @request.session[:blogger_id] = blogger ? bloggers(blogger).id : nil
  end

  def authorize_as(user)
    @request.env["HTTP_AUTHORIZATION"] = user ? ActionController::HttpAuthentication::Basic.encode_credentials(users(user).login, 'test') : nil
  end
end
