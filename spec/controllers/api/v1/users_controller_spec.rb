require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  describe 'GET #show' do
    it 'should respond with user json' do
      @User = FactoryGirl.create :user
      get :show, {id:@User.id}
      user_response = json_response

      expect(response.status).to equal(200)
      expect(user_response[:email]).to include(@User.email)
    end
  end



  describe 'POST #create' do
    context "when is successfully created" do
      before(:each) do
        @user_attr = FactoryGirl.attributes_for :user
        post :create, {user:@user_attr}
        @user_response = json_response
      end

      it 'should respond with 201' do
        expect(response.status).to equal(201)
      end

      it 'renders created user json' do
        expect(@user_response[:email]).to include(@user_attr[:email])
      end
    end

    context "when is not successfully created" do

      before(:each) do
        @bad_attr = {bad_attr:"not valid"}
        post :create, {user:@bad_attr}
        @user_response = json_response
      end

      it 'should respond with 422' do
        expect(response.status).to equal(422)
      end

      it 'should render errors json' do
        expect(@user_response).to have_key(:errors)
        expect(@user_response[:errors][:email]).to include("can't be blank")
      end

    end
  end

  describe 'PUT/PATCH #update' do
    context 'when it is successfully updated' do

      before(:each) do
        @user = FactoryGirl.create :user
        api_authorization_header @user.auth_token
        patch :update, {id:@user.id, user:{email:"updated@email.com"}}
        @user_response = json_response
      end

      it 'should respond with 200' do
        expect(response.status).to equal(200)
      end

      it 'renders updated user json' do
        expect(@user_response[:email]).to include("updated@email.com")
      end

    end

    context 'when it fails to update' do

      before(:each) do
        @user = FactoryGirl.create :user
        api_authorization_header @user.auth_token
        patch :update, {id:@user.id, user:{email:""}}
        @user_response = json_response
      end

      it 'should respond with 422' do
        expect(response.status).to equal(422)
      end

      it 'should render errors json' do
        expect(@user_response).to have_key(:errors)
        expect(@user_response[:errors][:email]).to include("can't be blank")
      end

    end
  end

  describe "DELETE #destroy" do
    it "should delete an item" do
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
      delete :destroy, {id: @user.id}

      expect(response.status).to equal(204)
    end
  end


end
