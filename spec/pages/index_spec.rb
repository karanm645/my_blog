require 'rails_helper'

RSpec.describe "Pages", type: :feature do
  describe "GET /index" do
    it "returns a success response" do 
      visit root_path
      
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome to my Blog!")
    end 

    it "has an about page" do 
      visit about_path 

      expect(current_path).to eq(about_path)
    end 
  end
end
