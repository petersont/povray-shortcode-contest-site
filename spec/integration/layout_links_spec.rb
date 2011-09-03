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


  #exercise 5.5 / listing 5.30
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should render_template('pages/about')
    click_link "Contact"
    response.should render_template('pages/contact')
    click_link "Home"
    response.should render_template('pages/home')
    click_link "Sign up now!"
    response.should render_template('users/new')
  end
end
