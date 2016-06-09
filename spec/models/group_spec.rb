require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'should validate' do
    before :each do
    @valid_group = Group.new(
        title: "Example Group",
        description: "The coolest group.",
        location: "makeshop",
        time: "afternoon",
        weekday: "monday",
      )
      @invalid_group = Group.new(
        title: "",
        description: "",
        location: "the moon",
        time: "not afternoon",
        weekday: "not one of them",
      )
    end

    it "title should validate" do
      @valid_group.valid?
      @invalid_group.valid?
      assert !@valid_group.errors[:title].any?
      assert @invalid_group.errors[:title].any?
    end

    it "description should validate" do
      @valid_group.valid?
      @invalid_group.valid?
      assert !@valid_group.errors[:description].any?
      assert !@invalid_group.errors[:description].any?
    end

    it "location should validate" do
      @valid_group.valid?
      @invalid_group.valid?
      assert !@valid_group.errors[:location].any?
      assert @invalid_group.errors[:location].any?
    end

    it 'weekday should validate' do
      @valid_group.valid?
      @invalid_group.valid?
      assert !@valid_group.errors[:weekday].any?
      assert @invalid_group.errors[:weekday].any?
    end

    it "time should validate" do
      @valid_group.valid?
      @invalid_group.valid?
      assert !@valid_group.errors[:time].any?
      assert @invalid_group.errors[:time].any?
    end

    # it "leader email should validate" do
    #   @valid_group.valid?
    #   @invalid_group.valid?
    #   assert !@valid_group.errors[:leader_email].any?
    #   assert @invalid_group.errors[:leader_email].any?
    # end

    # it "leader name should validate" do
    #   @valid_group.valid?
    #   @invalid_group.valid?
    #   assert !@valid_group.errors[:leader_name].any?
    #   assert @invalid_group.errors[:leader_name].any?
    # end

    it "should validate" do
      assert @valid_group.valid?
      assert !@invalid_group.valid?
    end
  end

  describe 'should respond to fields' do
    before(:each) do
      @group = FactoryGirl.create :group
    end

    it {expect(@group).to respond_to(:title)}
    it {expect(@group).to respond_to(:description)}
    it {expect(@group).to respond_to(:location)}
    it {expect(@group).to respond_to(:time)}
    it {expect(@group).to respond_to(:weekday)}
    it {expect(@group).to respond_to(:age_cloverbud)}
    it {expect(@group).to respond_to(:age_intermediate)}
    it {expect(@group).to respond_to(:age_junior)}
    it {expect(@group).to respond_to(:age_senior)}
    it {expect(@group).to respond_to(:user_id)}
    it {expect(@group).to respond_to(:approved)}
  end

end
