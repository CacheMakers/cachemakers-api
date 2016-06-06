require 'rails_helper'

describe Api::V1::GroupsController, type: :controller do
  before(:each){}

  describe 'GET #show' do

    it 'should return group json if group exists' do
      @group = FactoryGirl.create :group
      get :show, id: @group.id, format: :json
      group_response = JSON.parse(response.body)
      expect(response.status).to equal(200)
      expect(group_response).to have_key("group")
    end

    # it 'should return not found if group doesnt exist' do TODO
    #   get :show, id: 1, format: :json
    #   group_response = JSON.parse(response.body)
    #   expect(response.status).to equal(404)
    # end

  end

  describe 'POST #create' do
    context "when is successfully created" do
      before(:each) do
        @group_attr = FactoryGirl.attributes_for :group
        post :create, {group:@group_attr}, format: :json
        @group_response = JSON.parse(response.body)
      end

      it 'should respond with 201' do
        expect(response.status).to equal(201)
      end

      it 'renders created user json' do
        expect(@group_response['group']['title']).to include("Example Group")
      end
    end

    context "when is not successfully created" do

      before(:each) do
        @bad_attr = {bad_attr:"not valid"}
        post :create, {group:@bad_attr}, format: :json
        @group_response = JSON.parse(response.body)
      end

      it 'should respond with 422' do
        expect(response.status).to equal(422)
      end

      it 'should render errors json' do
        expect(@group_response).to have_key("errors")
        expect(@group_response["errors"]["title"]).to include("can't be blank")
      end

    end
  end

  describe 'PUT/PATCH #update' do
    context 'when it is successfully updated' do

      before(:each) do
        @group = FactoryGirl.create :group
        patch :update, {id:@group.id, group:{title:"Updated Title"}}, format: :json
        @group_response = JSON.parse(response.body)
      end

      it 'should respond with 200' do
        expect(response.status).to equal(200)
      end

      it 'renders updated user json' do
        expect(@group_response['group']['title']).to include("Updated Title")
      end

    end

    context 'when it fails to update' do

      before(:each) do
        @group = FactoryGirl.create :group
        patch :update, {id:@group.id, group:{title:""}}, format: :json
        @group_response = JSON.parse(response.body)
      end

      it 'should respond with 422' do
        expect(response.status).to equal(422)
      end

      it 'should render errors json' do
        expect(@group_response).to have_key("errors")
        expect(@group_response["errors"]["title"]).to include("can't be blank")
      end

    end
  end

  describe "DELETE #destroy" do
    context "successfully deletes" do
      before(:each) do
        @group = FactoryGirl.create :group
        delete :destroy, {id:@group.id}, format: :json
      end

      it 'should respond with 204' do
        expect(response.status).to equal(204)
      end
      
    end
  end

end
