require 'spec_helper'

describe BuildMemes do
  include Rack::Test::Methods
  
  def app
    BuildMemes
  end
  
  it "should display index page" do
    get "/"
    last_response.should be_successful
  end

  it "should redirect /p to a pass image" do
    get "/p"
    last_response.should be_redirect
    last_response.location.should match /\/pass\/[0-9]{2}.[jpg|jpeg|gif|png]/
  end
  
  it "should redirect /f to a fail image" do
    get "/f"
    last_response.should be_redirect
    last_response.location.should match /\/fail\/[0-9]{2}.[jpg|jpeg|gif|png]/
  end

end