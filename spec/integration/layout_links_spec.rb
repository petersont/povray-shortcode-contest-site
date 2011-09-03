require 'spec_helper'

describe "Layout links" do
  it "should have a Home page at '/'" do
    get '/'
    response.should render_template('pages/home')
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should render_template('pages/contact')
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should render_template('pages/about')
  end

=begin
  it "should have a Help page at '/help'" do
    get '/help'
    response.should render_template('pages/help')
  end
=end


#same file as for other layout links, even though 
#the signup page is in a DIFFERENT CONTROLLER.
#we can do this cuz we're using integration tests!
  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should render_template('users/new')
  end

end
