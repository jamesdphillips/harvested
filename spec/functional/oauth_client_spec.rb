require 'spec_helper'

describe 'harvest oauth client' do
  it 'returns the result of whoami' do
    cassette('oauth1') do
      user = oauth_harvest.account.who_am_i
      user.email.should == credentials["username"]
    end
  end
end