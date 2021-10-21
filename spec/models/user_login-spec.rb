require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'there must be a password' do
      @user = User.new
      @user.password = '123'
      expect(@user.password).to be_present
    end

    it 'password should not match' do
      @user = User.new
      @user.password = '123'
      @user.password_confirmation = '234'

      expect(@user.password).not_to eq (@user.password_confirmation)
    end

    it 'there should be password confirmation' do
      @user = User.new
      @user.password_confirmation = '234'
      expect(@user.password_confirmation).to be_present
    end
    it 'password should match' do
      @user = User.new
      @user.password = '123'
      @user.password_confirmation = '123'

      expect(@user.password).to eq (@user.password_confirmation)
    end
  end

  describe 'emails must be unique' do
    it 'passwords should not be case sensitive', :focus do
      @user = User.new(email: "user@email.COM")
      @user1 = User.new(email: "user@email.com")
      expect(@user1).to_not be_valid
    end
  end

  describe 'Email validation' do
    it "not valid without a name", :focus do
      @user = User.new(name: nil)
      expect(@user).to_not be_valid
    end

    
    it "not valid without a email", :focus do
      @user = User.new(email: nil)
      expect(@user).to_not be_valid
    end

    
  end
end
