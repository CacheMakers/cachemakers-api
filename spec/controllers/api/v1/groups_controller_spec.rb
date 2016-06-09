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
        @group_attr = FactoryGirl.attributes_for :group
        post :create, {group:@group_attr}
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
        @bad_attr = {bad_attr:"not valid"}
        post :create, {group:@bad_attr}
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
  end

  describe 'PUT/PATCH #update' do
    context 'when it is successfully updated' do

      before(:each) do
        @group = FactoryGirl.create :group
        patch :update, {id:@group.id, group:{title:"Updated Title"}}
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
        @group = FactoryGirl.create :group
        patch :update, {id:@group.id, group:{title:""}}
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
        @group = FactoryGirl.create :group
        delete :destroy, {id:@group.id}
      end

      it 'should respond with 204' do
        expect(response.status).to equal(204)
      end

    end
  end

end
