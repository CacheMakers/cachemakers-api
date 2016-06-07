require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do

  describe 'POST #create' do
    context 'credentials are correct' do

      before(:each) do
        @user = FactoryGirl.create :user
      end

      it 'should return user with token' do
        credentials = {email:@user.email, password:"12345678"}
        post :create, {session:credentials}
        session_resp = json_response

        @user.reload
        expect(response.status).to eql(200)
        expect(session_resp[:email]).to eql(@user.email)
        expect(session_resp[:auth_token]).to eql(@user.auth_token)
      end
    end

    context 'credentials are not correct' do
      before(:each) do
        @user = FactoryGirl.create :user
      end

      it 'should return errors' do
        credentials = {email:@user.email, encrypted_password:"bad_pass"}
        post :create, {session:credentials}
        session_resp = json_response

        @user.reload
        expect(response.status).to equal(422)
        expect(session_resp[:errors]).to eql ("Invalid email or password")
      end

    end
  end

  describe "DELETE #destory" do
    before(:each) do
      user = FactoryGirl.create :user
      sign_in user
      delete :destroy, {id:user.auth_token}
    end

    it "should respond with 204" do
      expect(response.status).to eql(204)
    end
  end

end
