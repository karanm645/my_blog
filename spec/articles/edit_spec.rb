require 'rails_helper'

RSpec.describe 'Edit Article', type: :feature do 
  describe 'when I visit the article show page' do 
    it 'has a link to edit the article' do 
      user_1 = User.create!(username: "karan443", email: "karanm645@gmail.com")
      article_1 = Article.create!(title: "1233", description: "fewafewafawefwaf", user_id: user_1.id)
      visit articles_path

      click_link "Edit"

      visit edit_article_path(article_1.id)

      fill_in 'Title', with: "third article"
      fill_in 'Description', with: "zzzfjiewofjieolslslslslslsllssl"
      click_button "Update"

      visit articles_path
      expect(current_path).to eq(articles_path)
    end 

    it 'back link to articles index page' do 
      user_1 = User.create!(username: "karan443", email: "karanm645@gmail.com")
      article_1 = Article.create!(title: "1233", description: "fewafewafawefwaf", user_id: user_1.id)

      visit edit_article_path(article_1.id)
      click_link "Back"

      expect(current_path).to eq(articles_path)
    end 
  end 
end 