require 'rails_helper'

RSpec.describe "Articles", type: :feature do
  describe "POST /artices/new" do
    it "returns a success response" do 
      visit new_article_path
      
      expect(current_path).to eq(new_article_path)
      expect(page).to have_content("Create an article")
    end 

    it "create a new article" do 
      visit new_article_path

      fill_in 'Title', with: 'my first blog post'
      fill_in 'Description', with: 'my first description'
      click_button 'Submit'

      # visit articles_path 
      expect(current_path).to eq(articles_path)

      expect(page).to have_content('my first blog post')
    end 
  end 
end 