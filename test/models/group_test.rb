require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @valid_group = Group.new(title: "Example Group", description: "The coolest group.",
      location: "makeshop", time: "afternoon")
    @invalid_group = Group.new(title: "", description: "",
        location: "the moon", time: "not afternoon")
  end

  test "title should validate" do
  end

  test "description should validate" do
  end

  test "location should validate" do
  end

  test "time should validate" do
  end 

  test "should validate" do
    assert @valid_group.valid?
    assert !@invalid_group.valid?
  end

end
