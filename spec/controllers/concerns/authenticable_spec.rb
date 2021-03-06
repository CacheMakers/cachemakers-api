require 'spec_helper'

class Authentication
  include Authenticable

  def request
  end

  def response
  end
end

describe Authenticable do
  let(:authentication) { Authentication.new }
  subject { authentication }

  describe "#current_user" do
    before do
      @user = FactoryGirl.create :user
      request.headers["Authorization"] = @user.auth_token
      allow(authentication).to receive(:request) {request}
    end

    it "returns the user from the authorization header" do
      expect(authentication.current_user.auth_token).to eql @user.auth_token
    end
  end

  describe '#authenticate_with_token' do
    before do
      @user = FactoryGirl.create :user
      allow(authentication).to receive(:current_user){ nil }
      allow(response).to receive(:status){ 401 }
      allow(response).to receive(:body){{ "errors" => "Not authenticated"}.to_json}
      allow(authentication).to receive(:response){ response }
    end

    it "render a json error message" do
      expect(json_response[:errors]).to eql "Not authenticated"
    end

    it 'should responsd' do
      expect(response.status).to eql(401)
    end
  end
end
