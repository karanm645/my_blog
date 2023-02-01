require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:email)}
  end 

  describe 'relations' do 
    it { should have_many :articles}
  end 

  describe 'password encryption' do 
    it "encrypts the password" do 
      user = User.new
      user.password = "my password"
      expect(user.password_digest).to_not eq("my password")
    end 
  end 
end 