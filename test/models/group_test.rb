require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @valid_group = Group.new(title: "Example Group", description: "The coolest group.",
      location: "makeshop", time: "afternoon")
    @invalid_group = Group.new(title: "", description: "",
        location: "the moon", time: "not afternoon")
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

  test "should validate" do
    assert @valid_group.valid?
    assert !@invalid_group.valid?
  end

end
