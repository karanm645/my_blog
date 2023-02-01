require 'rails_helper'

RSpec.describe "Article Show Page", type: :feature do 
  describe "when i visit the articles show page" do 
    
    it "shows the article title and description" do 
      user_1 = User.create!(username: "karan443", email: "karanm645@gmail.com", password_digest: "my password")
      article_1 = Article.create!(title: "1233", description: "fewafewafawefwaf", user_id: user_1.id)
      
      visit articles_path 

      click_link article_1.title

      visit article_path(article_1.id)

      expect(page).to have_content(article_1.description)
    end

    it 'back link to articles index page' do 
      user_1 = User.create!(username: "karan443", email: "karanm645@gmail.com", password_digest: "my password")
      article_1 = Article.create!(title: "1233", description: "fewafewafawefwaf", user_id: user_1.id)

      visit article_path(article_1.id)
      click_link "Back"

      expect(current_path).to eq(articles_path)
    end 

    it 'has a link to edit the article' do 
      user_1 = User.create!(username: "karan443", email: "karanm645@gmail.com", password_digest: "my password")
      article_1 = Article.create!(title: "1233", description: "fewafewafawefwaf", user_id: user_1.id)
      
      visit article_path(article_1.id)

      click_link "Edit"

      visit edit_article_path(article_1.id)

      fill_in 'Title', with: "third article"
      fill_in 'Description', with: "zzzfjiewofjieolslslslslslsllssl"
      click_button "Update"

      visit articles_path
      expect(current_path).to eq(articles_path)
    end 

  end 
end 