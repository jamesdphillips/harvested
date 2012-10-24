require 'spec_helper'

describe 'credentials' do
  describe "#valid?" do
    it "should return true if domain, username, and password is filled out" do
      Harvest::Credentials::Basic.new("some-domain", "username", "password").should be_valid
      Harvest::Credentials::OAuth.new("some-domain", "token").should be_valid
    end
    
    it "should return false if either domain, username, or password is nil" do
      Harvest::Credentials::Basic.new("some-domain", "username", nil).should_not be_valid
      Harvest::Credentials::Basic.new("some-domain", nil, "password").should_not be_valid
      Harvest::Credentials::Basic.new(nil, "username", "password").should_not be_valid
      Harvest::Credentials::Basic.new(nil, nil, nil).should_not be_valid
      Harvest::Credentials::OAuth.new("some-domain", nil).should_not be_valid
      Harvest::Credentials::OAuth.new(nil, "token").should_not be_valid
      Harvest::Credentials::OAuth.new("some-domain", nil, {:ssl => true}).should_not be_valid
      Harvest::Credentials::OAuth.new(nil, "token", {:ssl => true}).should_not be_valid
    end
  end
  
  describe "#basic_auth" do
    it "should base64 encode the credentials" do
      Harvest::Credentials::Basic.new("some-domain", "username", "password").basic_auth.should == "dXNlcm5hbWU6cGFzc3dvcmQ="
      Harvest::Credentials::OAuth.new("some-domain", "some-token").header.should == "Bearer some-token"
    end
  end
end