require 'rails_helper'

describe Api::V1::GroupsController, type: :controller do

  describe 'GET #show' do
    it 'should return group json if group exists' do
      @group = FactoryGirl.create :group
      get :show, id: @group.id
      group_response = json_response
      expect(response.status).to equal(200)
      expect(group_response).to have_key(:group)
    end
  end

  describe 'POST #create' do
    context "when is successfully created" do
      before(:each) do
        user = FactoryGirl.create :user
        @group_attr = FactoryGirl.attributes_for :group
        api_authorization_header user.auth_token

        post :create, {user_id: user.id, group: @group_attr}
        @group_response = json_response
      end

      it 'should respond with 201' do
        expect(response.status).to eql(201)
      end

      it 'renders created user json' do
        expect(@group_response[:group][:title]).to include("Example Group")
      end
    end

    context "when is not successfully created" do
      before(:each) do
        user = FactoryGirl.create :user
        @bad_attr = {bad_attr:"not valid"}
        api_authorization_header user.auth_token
        post :create, { user_id: user.id, group: @bad_attr }
        @group_response = json_response
      end

      it 'should respond with 422' do
        expect(response.status).to eql(422)
      end

      it 'should render errors json' do
        expect(@group_response).to have_key(:errors)
        expect(@group_response[:errors][:title]).to include("can't be blank")
      end
    end

    context "when user is not logged in" do
      before(:each) do
        user = FactoryGirl.create :user
        @group_attr = FactoryGirl.attributes_for :group
        post :create, {user_id: user.id, group: @group_attr}
        @group_response = json_response
      end

      it 'should respond with 401' do
        expect(response.status).to eql(401)
      end

      it 'should render errors json' do
        expect(@group_response).to have_key(:errors)
        expect(@group_response[:errors]).to include("Not Authenticated")
      end

    end
  end

  describe 'PUT/PATCH #update' do
    context 'when it is successfully updated' do

      before(:each) do
        user = FactoryGirl.create :user
        api_authorization_header user.auth_token
        @group = FactoryGirl.create :group, user: user
        api_authorization_header user.auth_token
        patch :update, {user_id: user.id, id:@group.id, group:{title:"Updated Title"}}
        @group_response = json_response
      end

      it 'should respond with 200' do
        expect(response.status).to equal(200)
      end

      it 'renders updated user json' do
        expect(@group_response[:group][:title]).to include("Updated Title")
      end

    end

    context 'when it fails to update' do

      before(:each) do
        user = FactoryGirl.create :user
        api_authorization_header user.auth_token
        @group = FactoryGirl.create :group, user: user
        patch :update, {user_id: user.id, id: @group.id, group:{title:""}}
        @group_response = json_response
      end

      it 'should respond with 422' do
        expect(response.status).to equal(422)
      end

      it 'should render errors json' do
        expect(@group_response).to have_key(:errors)
        expect(@group_response[:errors][:title]).to include("can't be blank")
      end

    end
  end

  describe "DELETE #destroy" do
    context "successfully deletes" do
      before(:each) do
        user = FactoryGirl.create :user
        api_authorization_header user.auth_token
        @group = FactoryGirl.create :group, user: user
        delete :destroy, {user_id: user.id, id:@group.id}
      end

      it 'should respond with 204' do
        expect(response.status).to equal(204)
      end

    end
  end

  describe 'json content' do
    before(:each) do
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
      @group = FactoryGirl.create :group, user: @user
      get :show, id: @group.id
      @group_response = json_response
    end

    it 'should contain group leader object' do
      expect(@group_response[:group][:user][:email]).to eql(@user.email)
    end

    it 'should not contain leader auth token' do
      expect(@group_response[:group][:user][:auth_token]).to eql(nil)
    end
  end

end
