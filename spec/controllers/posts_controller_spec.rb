require 'spec_helper'

describe PostsController do
  before do 
    @user = login_new_user
  end

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
    context "when the post is tagged by the current user"
    
    before(:each) do
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
        post :create, :post => { :title => 'a title', :body => 'a body'}, :tag_list => "tag1, tag2"
      end

      it "should flash an error message" do
        do_post
        flash[:notice].should_not be_nil
        end

      it "should show all the posts" do
        do_post
        response.should_not be_nil
      end
      
      it "should add the new post to the main page" do
        lambda do
          do_post
        end.should change(Post,:count).by(1)
      end

      it "should add the passed tags to the post" do 
        do_post
        assigns[:post].tags.count.should == 2
      end

    end    

    context "when params are invalid" do
        def do_post
          post :create, :post => { :title => nil, :body => nil }
        end
        
      
        it "should flash an error message" do
          do_post
          flash[:notice].should_not be_nil
        end
      
    
        it "should render the 'new' template" do
          do_post
          response.should render_template('new')
        end
      

        it "should not increase count of the post" do
          lambda do 
            do_post
          end.should_not change(Post,:count)
        end
      end 
    
  end

  describe "GET /posts/:id/edit" do
    def create_post
      @post = create_new_post
    end
    
    def do_get
      create_post
      get :edit, :id =>@post.id
    end

    it "should render the edit template" do
      do_get
      response.should render_template('edit')
    end         
  end   
 end
