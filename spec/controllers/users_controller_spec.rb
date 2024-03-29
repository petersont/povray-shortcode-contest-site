require 'spec_helper'

describe UsersController do
  integrate_views

  #Delete these examples and add some real ones
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_tag("title", /Sign up/)
    end
  end

  describe "GET 'show'" do
    
    before(:each) do
      @user = Factory(:user)
      #arrange for User.find(params[:id]) to find the right user.
      User.stub!(:find, @user.id).and_return(@user) #stub is from rspec, avoid 
                                             #hits to database
    end

    it "should be successful" do
      get :show, :id => @user   #automatically converts @user to @user.id 
      response.should be_success
    end
  end  
end
