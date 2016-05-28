require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @valid_group = Group.new(
      title: "Example Group",
      description: "The coolest group.",
      location: "makeshop",
      time: "afternoon",
      leader_email: "test@test.com",
      leader_name: "Test Leader"
    )
    @invalid_group = Group.new(
      title: "",
      description: "",
      location: "the moon",
      time: "not afternoon",
      leader_email: "test@testcom",
      leader_name: ""
    )
  end

  test "title should validate" do
    @valid_group.valid?
    @invalid_group.valid?
    assert !@valid_group.errors[:title].any?
    assert @invalid_group.errors[:title].any?
  end

  test "description should validate" do
    @valid_group.valid?
    @invalid_group.valid?
    assert !@valid_group.errors[:description].any?
    assert !@invalid_group.errors[:description].any?
  end

  test "location should validate" do
    @valid_group.valid?
    @invalid_group.valid?
    assert !@valid_group.errors[:location].any?
    assert @invalid_group.errors[:location].any?
  end

  test "time should validate" do
    @valid_group.valid?
    @invalid_group.valid?
    assert !@valid_group.errors[:time].any?
    assert @invalid_group.errors[:time].any?
  end

  test "leader email should validate" do
    @valid_group.valid?
    @invalid_group.valid?
    assert !@valid_group.errors[:leader_email].any?
    assert @invalid_group.errors[:leader_email].any?
  end

  test "leader name should validate" do
    @valid_group.valid?
    @invalid_group.valid?
    assert !@valid_group.errors[:leader_name].any?
    assert @invalid_group.errors[:leader_name].any?
  end

  test "should validate" do
    assert @valid_group.valid?
    assert !@invalid_group.valid?
  end

end
