require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each){@User = FactoryGirl.create :user}

  it 'should respond to fields' do
    expect(@User).to respond_to(:email)
    expect(@User).to respond_to(:password)
    expect(@User).to respond_to(:password_confirmation)
  end

end
