module UserSpecHelper 
  def create_active_user(options = { })
    user = User.new({:login => 'user', :email => 'user@email.com', :password => "password", :password_confirmation => "password"}.merge(options))
    user.save
    user
  end

  def login_new_user
    user = create_active_user
    #user = mock_model(User,:login => 'user')#, :email => 'user@email.com', :password => "password", :password_confirmation => "password")
    controller.stub!(:login_required).and_return(true)
    controller.stub!(:current_user).and_return(user)
    user
  end 


end
