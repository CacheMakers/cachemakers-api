require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  it 'should run a test' do
    expect(true).to be true
  end

  # describe 'index' do

    # it 'should handle an empty groups list' do
    #   create_group
    #   get :index
    #   expect(response).to be_success
    #   expect(JSON.parse(response.body)).to have_key('meta')
    #   expect(JSON.parse(response.body)).to have_key('groups')
    #   expect(JSON.parse(response.body)['groups'].count).to equal(0)
    # end

  #   it 'should return list of groups' do
  #     10.times {create_group}
  #     get :index
  #
  #     expect(response).to be_success
  #     expect(JSON.parse(response.body)['groups'].count).to equal(10)
  #   end
  # end
  #
  # describe 'show' do
  #   it 'should return empty json if group doesnt exist' do
  #     get :show, :id => 1
  #     binding.pry
  #     expect(response).to be_success
  #     expect(JSON.parse(response.body)).to have_key('meta')
  #     expect(JSON.parse(response.body)).to have_key('group')
  #   end
  #
  #   it 'should return json if group exists' do
  #     create_group
  #
  #     get :show, :id => 1
  #
  #     expect(response).to be_success
  #     expect(JSON.parse(response.body)).to have_key('meta')
  #     expect(JSON.parse(response.body)).to have_key('group')
  #     expect(JSON.parse(response.body)['group']).to have_key('title')
  #   end
  # end
  #
  # describe 'update' do
  #   it 'should update only specified field' do
  #     create_group
  #
  #     post :update, :title => "Updated Title"
  #
  #     body = JSON.parse(response.body)
  #     expect(response).to be_success
  #     expect(body['group']['title']).to equal("Updated Title")
  #     expect(body['meta']).to equal("Successfully Updated")
  #   end
  # end
  #
  #
  # describe 'destroy' do
  #   it 'should handle group not existing' do
  #
  #     post :destroy, :id => 1
  #
  #     body = JSON.parse(response.body)
  #     expect(response.status).to equal(404)
  #     expect(body['meta']).to equal("Successfully Removed")
  #   end
  #
  #   it 'should remove a group if exists' do
  #     create_group
  #
  #     post :destroy, :id => 1
  #
  #     body = JSON.parse(response.body)
  #     expect(response).to be_success
  #     expect(body['meta']).to equal("Successfully Removed")
  #   end
  # end


end

def create_group
    group = Group.create(
      title: "Group Controller Test Group",
      description: "The coolest group.",
      location: "makeshop",
      time: "afternoon",
      weekday: "monday",
      leader_email: "test_controller_group@test.com",
      leader_name: "Test Leader"
    )
end

def remove_group group
  group.destroy
end
