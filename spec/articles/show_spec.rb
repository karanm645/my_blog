require 'rails_helper'

RSpec.describe "Article Show Page", type: :feature do 
  describe "when i visit the articles show page" do 
    
    it "shows the article title and description" do 
      article_1 = Articles.create!(id: 1, title: "My first blog", description: "fewafewfawefawefeawfewaf")
      
      visit articles_path 

      click_link "show"

      visit article_path(1)

      expect(page).to have_content(article_1.description)
    end
  end 
end 