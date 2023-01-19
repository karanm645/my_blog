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
      article_1 = Articles.create!(title: "1233", description: "fewafewafawefwaf")
      visit articles_path
      
      expect(page).to have_content(article_1.title)
    end 


  end 
end 