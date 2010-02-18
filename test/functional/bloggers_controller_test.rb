require File.dirname(__FILE__) + '/../test_helper'
require 'bloggers_controller'

# Re-raise errors caught by the controller.
class BloggersController; def rescue_action(e) raise e end; end

class BloggersControllerTest < Test::Unit::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead
  # Then, you can remove it from this and the units test.
  include AuthenticatedTestHelper

  fixtures :bloggers

  def setup
    @controller = BloggersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_allow_signup
    assert_difference 'Blogger.count' do
      create_blogger
      assert_response :redirect
    end
  end

  def test_should_require_login_on_signup
    assert_no_difference 'Blogger.count' do
      create_blogger(:login => nil)
      assert assigns(:blogger).errors.on(:login)
      assert_response :success
    end
  end

  def test_should_require_password_on_signup
    assert_no_difference 'Blogger.count' do
      create_blogger(:password => nil)
      assert assigns(:blogger).errors.on(:password)
      assert_response :success
    end
  end

  def test_should_require_password_confirmation_on_signup
    assert_no_difference 'Blogger.count' do
      create_blogger(:password_confirmation => nil)
      assert assigns(:blogger).errors.on(:password_confirmation)
      assert_response :success
    end
  end

  def test_should_require_email_on_signup
    assert_no_difference 'Blogger.count' do
      create_blogger(:email => nil)
      assert assigns(:blogger).errors.on(:email)
      assert_response :success
    end
  end
  

  

  protected
    def create_blogger(options = {})
      post :create, :blogger => { :login => 'quire', :email => 'quire@example.com',
        :password => 'quire', :password_confirmation => 'quire' }.merge(options)
    end
end
