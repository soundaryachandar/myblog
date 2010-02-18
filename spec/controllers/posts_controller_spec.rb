require 'spec_helper'

describe PostsController do

  describe "GET /index" do
    def do_get
      get :index
    end
    
    it "should be success" do
      do_get
      response.should be_success
    end
    
    it "should show all the posts" do
      do_get
      assigns[:post].should be_nil
    end
  end

describe "GET /show" do
    
    def create_post
      @post= create_new_post
    end
    
    def do_get
      create_post
      get :show, :id => @post.id
    end

    it "should be success" do
     do_get
     response.should be_success
    end

    it "should find all posts" do
      do_get
      assigns[:posts].should be_nil
    end

    it "should render the index.html.erb" do
      do_get
      response.should render_template('show')
    end
 end

  describe "GET /new" do
    def do_get
      get :new
    end

    it "should create a new post" do
      do_get
      response.should render_template('new')
    end
  end

describe "POST /posts" do
    context "when params are valid" do
      def do_post
        post :create, :post => { :title => 'a title', :body => 'a body' }
      end

       it "should flash an error message" do
        do_post
        flash[:notice].should_not be_nil
        end

      it "should show all the posts" do
        do_post
        response.should_not be_nil
      end

    context "when params are invalid" do
        def do_post
           post :create, :post => { :title => 'a title', :body => 'a body' }
      end
      end
      
      it "should flash an error message" do
        do_post
        flash[:notice].should_not be_nil
        end
      end
    end

end
