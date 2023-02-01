require 'rails_helper'

RSpec.describe "Article Index Page", type: :feature do
  describe "GET /articles" do 
# article main page -> shows articles, gets article information, 
    it 'has a button to create a new article' do 
      
      visit articles_path 

      click_link "Create Article"

      visit new_article_path
    end 

    it 'has a list of all articles' do 
      user_1 = User.create!(username: "karan443", email: "karanm645@gmail.com")
      article_1 = Article.create!(title: "1233", description: "fewafewafawefwaf", user_id: user_1.id)
     
      visit articles_path
      
      expect(page).to have_content(article_1.title)
    end 
    
    it 'shows user info in index page' do 
      user_1 = User.create!(username: "karan443", email: "karanm645@gmail.com")
      article_1 = Article.create!(title: "1233", description: "fewafewafawefwaf", user_id: user_1.id)
      
      visit articles_path

      expect(page).to have_content("Created by: #{user_1.username}")

    end 


  end 
end 