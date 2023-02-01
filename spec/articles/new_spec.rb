require 'rails_helper'

RSpec.describe "Articles", type: :feature do
  describe "POST /artices/new" do
    it "returns a success response" do 
      visit new_article_path
      
      expect(current_path).to eq(new_article_path)
      expect(page).to have_button("Create")
    end 

    it "create a new article" do 
      visit new_article_path
      user_1 = User.create!(username: "karan443", email: "karanm645@gmail.com", password_digest: "my password")
      
      
      fill_in 'Title', with: 'my first blog post'
      fill_in 'Description', with: 'my first description'
      click_button "Create"
      
      visit articles_path 

      expect(current_path).to eq(articles_path)
      expect(page).to have_content('my first blog post')
    end 

    it 'back link to articles index page' do 
      user_1 = User.create!(username: "karan443", email: "karanm645@gmail.com", password_digest: "my password")
      article_1 = Article.create!(title: "1233", description: "fewafewafawefwaf", user_id: user_1.id)

      visit new_article_path
      click_link "Back"

      expect(current_path).to eq(articles_path)
    end 
  end 
end 