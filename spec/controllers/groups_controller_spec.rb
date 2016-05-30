require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

end

def create_group
    group = Group.create(
      title: "Group Controller Test Group",
      description: "The coolest group.",
      location: "makeshop",
      time: "afternoon",
      leader_email: "test_controller_group@test.com",
      leader_name: "Test Leader"
    )
end

def remove_group group
  group.destroy
end
