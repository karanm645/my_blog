require 'rails_helper'

RSpec.describe "Destroy Article", type: :feature do 
  describe 'when i visit the index page' do
    it 'can delete the article' do 
      user_1 = User.create!(username: "karan443", email: "karanm645@gmail.com", password_digest: "my password")
      article_1 = Article.create!(title: "1233", description: "fewafewafawefwaf", user_id: user_1.id)

      visit articles_path
      expect(page).to have_content("1233")
      click_button "Delete"

      expect(page).to_not have_content("1233")
    end 

  end 
end