require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each){@user = FactoryGirl.create :user}

  it 'should respond to fields' do
    expect(@user).to respond_to(:email)
    expect(@user).to respond_to(:password)
    expect(@user).to respond_to(:password_confirmation)
    expect(@user).to respond_to(:auth_token)
  end

  describe 'generates unique token' do
    it 'generates a unique token' do
      allow(Devise).to receive(:friendly_token){"auniquetoken123"}
      @user.generate_authentication_token!
      expect(@user.auth_token).to eql("auniquetoken123")
    end

    it 'regenerates a new token if tries existing token' do
      existing_user = FactoryGirl.create(:user, auth_token: "auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eql("auniquetoken123")
      expect(@user.auth_token).not_to eql(nil)
    end
  end


end
