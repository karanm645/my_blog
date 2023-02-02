require 'rails_helper'

RSpec.describe "Users", type: :feature do
  describe 'user can sign-up' do 
    it 'can visit the new user page' do 
      visit signup_path
      
      expect(current_path).to eq(signup_path)
    end 
  end 
end 