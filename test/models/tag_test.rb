require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def setup
    @valid_tag = Tag.new(name:"science")
    @invalid_tag = Tag.new(name:"notvalidtag")
  end

  test "name should validate" do
    @valid_tag.valid?
    @invalid_tag.valid?
    assert !@valid_tag.errors[:name].any?
    assert @invalid_tag.errors[:name].any?
  end


  test "should validate" do
    assert @valid_tag.valid?
    assert !@invalid_tag.valid?
  end

end
